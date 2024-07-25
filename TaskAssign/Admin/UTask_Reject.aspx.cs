using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.Admin
{
    public partial class UTask_Reject : System.Web.UI.Page
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
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('File not found');", true);
                }
            }

            if (e.CommandName == "Approve")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                
               
                UpdateTaskStatus(taskId, "Approve");




                Response.Write("<script>alert('Task_Action');</script>");

            }

        }
        private string SaveFile(FileUpload fileUpload)
        {
            string filePath = "~/Task_File/" + Path.GetFileName(fileUpload.FileName);
            fileUpload.SaveAs(Server.MapPath(filePath));
            return filePath;
        }
        private void UpdateTaskStatus(int taskId, string taskStatus)
        {
            string q1 = $" Exec update_Resubmit '{taskId}','{taskStatus}'";
            SqlCommand cmd = new SqlCommand(q1, conn);
            cmd.ExecuteNonQuery();


            // Rebind the GridView to reflect the changes
            GridView1.DataBind();
        }
    }
}