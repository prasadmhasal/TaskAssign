using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.Login
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email, pass;
             email = Email.Text;
             pass = Pass.Text;

            string q1 = $"exec User_login '{email} ' ,'{pass}'";
            SqlCommand cmd = new SqlCommand(q1, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    if (rdr["User_email"].Equals(email) && rdr["User_pass"].Equals(pass) && rdr["User_role"].Equals("Admin"))
                    {
                        Response.Write($"<script>alert('{Session["ID"]}')</script>");
                        Response.Redirect("~/Admin/dashbord.aspx");
                    }

                    if (rdr["User_email"].Equals(email) && rdr["User_pass"].Equals(pass) && rdr["User_role"].Equals("User"))
                    {

                        Session["User_name"] = rdr["User_name"].ToString();
                       
                        Response.Write("<script>alert('login')</script>");

                        Response.Redirect("~/User/UserHome.aspx");
                    }
                    clear();
                    
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");
            }


        }
        protected void clear()
        {
              Email.Text ="";
              Pass.Text ="";
        }
    }
}