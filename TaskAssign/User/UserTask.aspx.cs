﻿using System;
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
            else if (e.CommandName == "OnTime")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                GridViewRow row = GridView1.Rows[rowIndex];
                FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
                string taskSolution = fileUpload.HasFile ? SaveFile(fileUpload) : string.Empty;

                UpdateTaskStatus(taskId, taskSolution, "On Time");
                // Hide the OnTimeButton or any other control you need to update
                Button onTimeButton = (Button)row.FindControl("OnTimeButton");

                if (onTimeButton != null) onTimeButton.Visible = false;

                Response.Write("<script>alert('Task_submited');</script>");

            }
            else if (e.CommandName == "Late")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                GridViewRow row = GridView1.Rows[rowIndex];
                FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
                string taskSolution = fileUpload.HasFile ? SaveFile(fileUpload) : string.Empty;
                UpdateTaskStatus(taskId, taskSolution, "Late");
                // Hide the OnTimeButton or any other control you need to update
                Button onTimeButton = (Button)row.FindControl("LateButton");
                if (onTimeButton != null)
                {
                    onTimeButton.Visible = false;
                }
                Response.Write("<script>alert('Task_submited');</script>");

            }
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

           
            // Rebind the GridView to reflect the changes
            GridView1.DataBind();
        }

      
     }
}
