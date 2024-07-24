using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.User
{
    public partial class Reject_Task : System.Web.UI.Page
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
           
            if (e.CommandName == "Submit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int taskId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
                GridViewRow row = GridView1.Rows[rowIndex];
                FileUpload fileUpload = (FileUpload)row.FindControl("FileUpload1");
                string ResolutionSolution = fileUpload.HasFile ? SaveFile(fileUpload) : string.Empty;
                UpdateTaskStatus(taskId, ResolutionSolution , "Resubmit");
               

                

                Response.Write("<script>alert('Task_submited');</script>");

            }
            
        }
        private string SaveFile(FileUpload fileUpload)
        {
            string filePath = "~/Task_File/" + Path.GetFileName(fileUpload.FileName);
            fileUpload.SaveAs(Server.MapPath(filePath));
            return filePath;
        }
        private void UpdateTaskStatus(int taskId, string ResolutionSolution ,string taskStatus)
        {
            string q1 = $" Exec Reject_resolution '{taskId}','{ResolutionSolution}','{taskStatus}'";
            SqlCommand cmd = new SqlCommand(q1, conn);
            cmd.ExecuteNonQuery();


            // Rebind the GridView to reflect the changes
            GridView1.DataBind();
        }
    }
}