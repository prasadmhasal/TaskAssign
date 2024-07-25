using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Mail;
using System.Net;
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
                    
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    
                    if (rowIndex >= 0)
                    {
                        GridViewRow row = GridView1.Rows[rowIndex];
                        int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                        string taskName = row.Cells[1].Text; 
                        string taskUser = row.Cells[2].Text; 
                        string taskSolution = (row.FindControl("DownloadButton") as Button)?.CommandArgument;
                        string taskStatus = row.Cells[4].Text; 
                        string taskSubmitDate = row.Cells[5].Text; 
                        string taskDate = row.Cells[6].Text; 
                        string taskFeedback = (row.FindControl("Task_Feedback") as TextBox)?.Text ?? string.Empty;
                        if (int.TryParse((row.FindControl("Task_score") as TextBox)?.Text, out int taskScore))
                        {
                            string taskApproveStatus = e.CommandName == "Approve_Task" ? "Approved" : "Rejected";

                            SaveTaskReviewAndDelete(taskId, taskName, taskUser, taskSolution, taskStatus, taskSubmitDate, taskDate, taskFeedback, taskScore, taskApproveStatus);
                            string userEmail = GetUserEmail(taskUser);

                            SendEmail(userEmail, taskName, taskApproveStatus);
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email Send The User');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid row index');", true);
                    }
                }
                catch (Exception ex)
                {
             
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                }
            }
        }
        private string GetUserEmail(string taskUser)
        {
            return Session["User_email"]?.ToString() ?? "user@example.com";
        }

        private void SendEmail(string userEmail, string taskName, string taskStatus)
        {
            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("Prasadmhasal@gmail.com");
                    mail.To.Add(userEmail);
                    mail.Subject = $"Task {taskStatus}: {taskName}";
                    if (taskStatus == "Approved")
                    {
                        mail.Body = $"Dear User,\n\nWe are pleased to inform you that your task submission '{taskName}' has been {taskStatus}.\n\nThank you for your effort and dedication.\n\nBest regards,\n[Your Company Name]";
                    }
                    else if (taskStatus == "Rejected")
                    {
                        mail.Body = $"Dear User,\n\nWe regret to inform you that your task submission '{taskName}' has been {taskStatus}.\n\nPlease review the task requirements and try again.\n\nIf you have any questions, feel free to contact us.\n\nBest regards,\n[Your Company Name]";
                    }
                    mail.IsBodyHtml = false;

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new NetworkCredential("prasadmhasal@gmail.com", "fxjuqdrhzmmeksyq");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }
            }
            catch (Exception ex)
            {
              
            }
        }

        private void SaveTaskReviewAndDelete(int taskId, string taskName, string taskUser,string taskSolution,string taskStatus,string taskSubmitDate , string taskDate,  string taskFeedback,int taskscore, string taskApproveStatus)
        {
            string insertQuery = $"Exec AddTaskReview '{taskId}', '{taskName}', '{taskUser}', '{taskSolution}', '{taskStatus}', '{taskSubmitDate}', '{taskDate}', '{taskFeedback}','{taskscore}', '{taskApproveStatus}'";
            SqlCommand cmd = new SqlCommand(insertQuery, conn);
            cmd.ExecuteNonQuery();
            using (SqlCommand deleteCommand = new SqlCommand("DeleteTask", conn))
                {
                    deleteCommand.CommandType = CommandType.StoredProcedure;
                    deleteCommand.Parameters.AddWithValue("@Task_id", taskId);
                    deleteCommand.ExecuteNonQuery();
                }
            
        }
    }
}