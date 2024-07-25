using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskAssign.User
{
    public partial class leaderborad : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            try
            {
                string g1 = "Exec GetStudentRankings";
                SqlDataAdapter da = new SqlDataAdapter(g1, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

               
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    
                    Response.Write("No data found.");
                }
            }
            catch (Exception ex)
            {
                
                Response.Write("Error: " + ex.Message);
            }
        }

    }
}
