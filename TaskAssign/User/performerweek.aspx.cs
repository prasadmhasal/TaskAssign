using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.User
{
    public partial class performerweek : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        }
        protected void WeekDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            string selectedValue = PeriodDropdown.SelectedValue;

            string g1 = $"exec fetchperformerweek '{selectedValue}'";
            SqlCommand sqlCommand = new SqlCommand(g1,conn);
            SqlDataReader reader = sqlCommand.ExecuteReader();
            reader.Read();
            DateTime fromdate = DateTime.Parse(reader["formdate"].ToString());
            DateTime todate = DateTime.Parse(reader["todate"].ToString());
           
            string f1 = $"exec assignperformer '{fromdate}','{todate}'";
            SqlCommand cmd1 = new SqlCommand(f1,conn);  
            SqlDataReader rdr = cmd1.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
          
        }
    }
}