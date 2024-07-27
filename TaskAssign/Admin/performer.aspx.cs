using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Globalization;

namespace TaskAssign.Admin
{
    public partial class performer : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["Task"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        }
        protected void btnFetchData_Click(object sender, EventArgs e)
        {
            string fromDate = txtFromDate.Text;
            string toDate = txtToDate.Text;

            DateTime fromDateParsed;
            DateTime toDateParsed;

            if (DateTime.TryParseExact(fromDate, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out fromDateParsed) &&
                DateTime.TryParseExact(toDate, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out toDateParsed))
            {
                
                string fromDateString = fromDateParsed.ToString("dd-MM-yyyy");
                string toDateString = toDateParsed.ToString("dd-MM-yyyy");

                DataTable dt = FetchData(fromDateString, toDateString);
                BindDataToDataList(dt);
            }
            else
            {
                Response.Write("<script>alert('Please enter valid dates in the format yyyy-MM-dd.')</script>");
            }
        }

        private DataTable FetchData(string fromDate, string toDate)
        {
            DataTable dt = new DataTable();


            string p = $"Exec assignperformer '{fromDate}','{toDate}'";
            SqlCommand cmd = new SqlCommand(p, conn);
               

                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
               
            

            return dt;
        }

        private void BindDataToDataList(DataTable dt)
        {
            dlCards.DataSource = dt;
            dlCards.DataBind();
        }


        public void push(object sender, EventArgs e)
        {
            string fromdate , todate , week  ;
            fromdate = txtFromDate.Text;
            todate = txtToDate.Text;
            week = TextBox1.Text;

            string w1 = $"exec performerweek '{fromdate}','{todate}','{week}'";
            SqlCommand cmd  = new SqlCommand(w1, conn);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('data insert succesfully')</script>");


        }
    }
}