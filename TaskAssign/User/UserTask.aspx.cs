using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.User
{
    public partial class UserTask : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    Response.Write("<script>alert('File not found');</script>");
                }
            }
            else if (e.CommandName == "OnTime" || e.CommandName == "Late")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                GridViewRow row = GridView1.Rows[rowIndex];
                FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
                string taskSolution = fileUpload.HasFile ? SaveFile(fileUpload) : string.Empty;


                string taskStatus = e.CommandName == "OnTime" ? "On Time" : "Late";

                UpdateTaskStatus(taskId, taskSolution, taskStatus);

                Button onTimeButton = (Button)row.FindControl("OnTimeButton");
                Button lateButton = (Button)row.FindControl("LateButton");
                Label statusLabel = (Label)row.FindControl("StatusLabel");

                if (onTimeButton != null)
                {
                    onTimeButton.Enabled = false;
                }
                if (lateButton != null)
                {
                    lateButton.Enabled = false;
                }
                else 
                {
                    onTimeButton.Enabled = false;
                    lateButton.Enabled = false;

                    statusLabel.Text = "Submitted";
                    statusLabel.ForeColor = System.Drawing.Color.Green;
                }


                Response.Write($"<script>alert('Task ID: {taskId}, Status: {taskStatus}');</script>");


                GridView1.DataBind();
            }
        }
        public bool IsButtonVisible(object button)
        {
            return button != null;
        }

        public bool CheckStatus(object status)
        {
            return status != null && (status.ToString() == "On Time" || status.ToString() == "Late");
        }
        protected bool IsLate(object taskDate)
        {
            DateTime taskDateTime;

            if (DateTime.TryParse(taskDate.ToString(), out taskDateTime))
            {

                return DateTime.Now > taskDateTime.AddHours(48);
            }
            return false;
        }
        private string SaveFile(FileUpload fileUpload)
        {
            string filePath = "~/Task_File/" + Path.GetFileName(fileUpload.FileName);
            fileUpload.SaveAs(Server.MapPath(filePath));
            return filePath;
        }
        private void UpdateTaskStatus(int taskId, string taskSolution, string taskStatus)
        {
            string Tasksubmit_date;
            Tasksubmit_date = DateTime.Now.ToString("dd-MM-yyyy");
            string q1 = $" Exec User_Task '{taskId}','{taskSolution}','{taskStatus}','{Tasksubmit_date}'";
            SqlCommand cmd = new SqlCommand(q1, conn);
            cmd.ExecuteNonQuery();
            GridView1.DataBind();
        }
     }
}