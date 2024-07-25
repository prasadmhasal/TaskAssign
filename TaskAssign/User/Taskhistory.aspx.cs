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
    public partial class Taskhistory : System.Web.UI.Page
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
        protected void PeriodDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridView();
        }

        private void BindGridView()
        {
            string period = PeriodDropdown.SelectedValue;
            DateTime startDate, endDate;

            switch (period)
            {
                case "Daily":
                    startDate = DateTime.Today;
                    endDate = startDate.AddDays(1).AddTicks(-1);
                    break;
                case "Weekly":
                    startDate = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek);
                    endDate = startDate.AddDays(7).AddTicks(-1);
                    break;
                case "Monthly":
                    startDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
                    endDate = startDate.AddMonths(1).AddTicks(-1);
                    break;
                case "Yearly":
                    startDate = new DateTime(DateTime.Today.Year, 1, 1);
                    endDate = startDate.AddYears(1).AddTicks(-1);
                    break;
                default:
                  
                    startDate = DateTime.Today;
                    endDate = startDate.AddDays(1).AddTicks(-1);
                    break;
            }
            string startDateStr = startDate.ToString("dd-MM-yyyy");
            string endDateStr = endDate.ToString("dd-MM-yyyy");

            BindGridViewData(startDateStr, endDateStr);
        }

        private void BindGridViewData(string startDateStr, string endDateStr)
        {
                string username = Session["User_name"].ToString();
                string query = $"Exec Usertask_history '{username}','{startDateStr}','{endDateStr}' ";
                 SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
          
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                
                GridView1.DataSource = null;
                GridView1.DataBind();
                
            }

        }
    }
}