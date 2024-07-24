using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.Admin
{
    public partial class TaskReview : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindGridView();
            }

        }
        private void BindGridView()
        {
            
        }
        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadFile")
            {
                string filePath = e.CommandArgument.ToString();
                string mappedPath = Server.MapPath(filePath);

                if (File.Exists(mappedPath))
                {
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                    Response.WriteFile(mappedPath);
                    Response.End();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('File not found');", true);
                }
            }
            else if (e.CommandName == "Approve_Task" || e.CommandName == "Reject_Task")
            {
                try
                {
                    // Get the row index from the CommandArgument
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    // Ensure rowIndex is within the valid range
                    if (rowIndex >= 0)
                    {
                        GridViewRow row = GridView1.Rows[rowIndex];
                        int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                        // Retrieve necessary values from the row
                        string taskName = row.Cells[1].Text; 
                        string taskUser = row.Cells[2].Text; 
                        string taskSolution = (row.FindControl("DownloadButton") as Button)?.CommandArgument;
                        string taskStatus = row.Cells[4].Text; 
                        string taskSubmitDate = row.Cells[5].Text; 
                        string taskDate = row.Cells[6].Text; 
                        string taskFeedback = (row.FindControl("Task_Feedback") as TextBox)?.Text ?? string.Empty;
                        string taskApproveStatus = e.CommandName == "Approve_Task" ? "Approved" : "Rejected";

                        // Call method to execute stored procedures
                        SaveTaskReviewAndDelete(taskId, taskName, taskUser, taskSolution, taskStatus, taskSubmitDate, taskDate, taskFeedback, taskApproveStatus);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid row index');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Log exception
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }

        private void SaveTaskReviewAndDelete(int taskId, string taskName, string taskUser,string taskSolution,string taskStatus,string taskSubmitDate , string taskDate,  string taskFeedback, string taskApproveStatus)
        {
            string insertQuery = $"Exec AddTaskReview '{taskId}', '{taskName}', '{taskUser}', '{taskSolution}', '{taskStatus}', '{taskSubmitDate}', '{taskDate}', '{taskFeedback}', '{taskApproveStatus}'";
            SqlCommand cmd = new SqlCommand(insertQuery, conn);
            cmd.ExecuteNonQuery();


            // Delete data from Task
            using (SqlCommand deleteCommand = new SqlCommand("DeleteTask", conn))
                {
                    deleteCommand.CommandType = CommandType.StoredProcedure;
                    deleteCommand.Parameters.AddWithValue("@Task_id", taskId);
                    deleteCommand.ExecuteNonQuery();
                }
            
        }
    }
}