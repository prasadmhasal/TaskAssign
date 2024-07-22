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

namespace TaskAssign.Admin
{
    public partial class dashbord : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindBatchDropdown();
            }
        }

        private void BindBatchDropdown()
        {
            try
            {
                   string query = "exec fetch_batch";
                   SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader rdr = cmd.ExecuteReader();
                ddlbatch.DataSource = rdr;
                ddlbatch.DataTextField = "User_batch";
                ddlbatch.DataValueField = "User_batch";
                     ddlbatch.DataBind();
                    rdr.Close();
              
                ddlbatch.Items.Insert(0, new ListItem("-- Select Batch --", ""));
            }
            catch (Exception ex)
            {

                Console.WriteLine("Error fetching courses: " + ex.Message);
            }
        }
        protected void ddlBatch_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Batch = ddlbatch.SelectedValue;

            if (!string.IsNullOrEmpty(Batch))
            {
                ddlUser_SelectedIndexChanged(Batch);
            }
            else
            {
                ddlUser_name.Items.Clear();
                ddlUser_name.Items.Insert(0, new ListItem("-- Select Branch --", ""));
            }
        }
        public void ddlUser_SelectedIndexChanged(string Batch)
        {
           
                try
                {
                    
                    string query = $"exec fetch_user '{Batch}'";
                      SqlCommand cmd = new SqlCommand(query, conn);
                      SqlDataReader rdr = cmd.ExecuteReader();
                        ddlUser_name.Items.Clear();

                        while (rdr.Read())
                        {
                            int User_id = Convert.ToInt32(rdr["User_Id"]);
                            Session["User_Id"] = User_id;
                            ddlUser_name.Items.Add(new ListItem(rdr["User_name"].ToString(), rdr["User_name"].ToString()));
                        }

                rdr.Close();
                   
                }
                catch (Exception ex)
                {

                    Console.WriteLine("Error fetching sub-courses: " + ex.Message);

              }
            
        }
        protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
        {

            string selectedUser = ddlUser_name.SelectedValue;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            
                if (FileUpload1.HasFile)
                {

                    try
                    {
                      
                        string Task_name, image ,Task_batch , Task_User;
                        Task_name = TextBox1.Text;
                        FileUpload1.SaveAs(Server.MapPath("/Task_File/") + Path.GetFileName(FileUpload1.FileName));
                        image = "/Task_File/" + Path.GetFileName(FileUpload1.FileName);
                        Task_batch = ddlbatch.SelectedItem.Text;
                        Task_User = ddlUser_name.SelectedItem.Text;

                        string q1 = $"exec  Task_assign '{Task_name}','{image}','{Task_batch}','{Task_User}'  ";
                        SqlCommand cmd = new SqlCommand(q1, conn);
                        int rowsAffected = cmd.ExecuteNonQuery();
                         

                        if (rowsAffected > 0)
                        {

                            Console.WriteLine("Data inserted successfully into Task table.");
                            Response.Write("<script>alert('Data inserted successfully into Course_video table')</script>");
                        }
                        else
                        {

                            Console.WriteLine("No rows affected. Data may not have been inserted.");
                        }
                    }
                    catch (Exception ex)
                    {

                        Console.WriteLine("Error inserting into Course_video: " + ex.Message);
                    }
                }
                else
                {
                    // Display message if no file is uploaded
                    Response.Write("<script>alert('Please select a file to upload')</script>");
                }
            clear();
        }

        private void  clear()
        {
            TextBox1.Text="";
            
        }
    }
}