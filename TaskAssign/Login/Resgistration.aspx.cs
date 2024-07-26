using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Text;

namespace TaskAssign.Login
{
    public partial class Resgistration : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        }

        protected void Signup_Click(object sender, EventArgs e)
        {
            string name, email, image, batch, pass, role = "User";
            name = Name.Text;
            email = Email.Text;
            FileUpload1.SaveAs(Server.MapPath("/image/") + Path.GetFileName(FileUpload1.FileName));
            image = "/image/" + Path.GetFileName(FileUpload1.FileName);
            batch = DropDownList1.SelectedValue;
            pass = RePass.Text;

            string q1 = $"exec User_re  '{name}' , '{email}','{image}','{batch}','{pass}','{role}'";
            SqlCommand cmd = new SqlCommand(q1, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Resgistration successfully')</script>");
            clear();

            //ShowSweetAlert("Good job!", "You clicked the button!", "success");
        }

        //private void ShowSweetAlert(string title, string message, string icon)
        //{

        //    // Build the JavaScript code for SweetAlert using StringBuilder
        //    StringBuilder script = new StringBuilder();
        //    script.Append("<script>");
        //    script.Append("$(document).ready(function() {");
        //    script.Append("Swal.fire({");
        //    script.AppendFormat("title: '{0}',", title);
        //    script.AppendFormat("text: '{0}',", message);
        //    script.AppendFormat("icon: '{0}',", icon);
        //    script.Append("});");
        //    script.Append("});");
        //    script.Append("</script>");

        //    // Register the script with the Page using ScriptManager
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "SweetAlertScript", script.ToString(), false);
        //}

        protected void clear()
        {
            Name.Text = "";
            Email.Text = "";
            Pass.Text = "";
            DropDownList1.SelectedValue = "";
            RePass.Text = "";

        }
    }
}