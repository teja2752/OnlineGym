using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineGym
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindFeesDetails();
            }
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFeesDetails();
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFeesDetails();
        }

        private void BindFeesDetails()
        {
            int year = int.Parse(ddlYear.SelectedValue.ToString());
            int month = int.Parse(ddlMonth.SelectedValue.ToString());
            int userId = int.Parse(Session["UserID"].ToString());
            string sQuery = "select PaidAmount,MOP,BankName,ChequeNo,BranchName from UserFeesDetails where UserID=" + userId + " and Year=" + year + " and Month=" + month;
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuery, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    lblAmount.Text = dr["PaidAmount"].ToString();
                    ddlMop.SelectedValue = dr["MOP"].ToString();
                    lblBank.Text = dr["BankName"].ToString();
                    lblBranch.Text = dr["BranchName"].ToString();
                    lblCheque.Text = dr["ChequeNo"].ToString();
                    lblAmount.ForeColor = System.Drawing.Color.Green;
                    ddlMop.Enabled = false;
                }
            }
            else
            {
                lblAmount.Text = "Not Paid";
                lblAmount.ForeColor = System.Drawing.Color.Red;
                ddlMop.SelectedValue = "1";
            }
        }

        protected void ddlMop_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlMop.Visible = false;
            if (ddlMop.SelectedValue != "1")
            {
                pnlMop.Visible = true;
            }
        }
    }
}