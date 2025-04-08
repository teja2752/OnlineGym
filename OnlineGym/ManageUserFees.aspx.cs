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
    public partial class ManageUserFees : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindUserDetails();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string sQuey = string.Empty;
            string Fees = txtFees.Text.ToString();
            int UserID = int.Parse(Session["UserID"].ToString());
            int Year = int.Parse(ddlYear.SelectedValue.ToString());
            int Month = int.Parse(ddlMonth.SelectedValue.ToString());
            int MOP=int.Parse(ddlMonth.SelectedValue.ToString());
            string BankName = ddlBankName.SelectedItem.Text.ToString();
            String BranchName = txtBranchName.Text.ToString();
            string ChequeNo = txtChequeNo.Text.ToString();
            string paidDate = DateTime.Now.ToString("MM/dd/yyyy");
            if (btnsubmit.Text == "Submit")
            {
                sQuey = "insert into UserFeesDetails (UserID,PaidAmount,PaidDate,Year,Month,MOP,BankName,BranchName,ChequeNo) values (" + UserID + ",'" + Fees + "','" + paidDate + "'," + Year + "," + Month + "," + MOP + ",'" + BankName + "','" + BranchName + "','" + ChequeNo + "')";
            }
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            cmd.ExecuteNonQuery();
            _sConn.Close();
            lblFeesPaid.Visible = true;
            ClearAll();

         
           
        }


        protected void BindUserDetails()
        {
            string sQuery = "select UserID,FullName,MobileNo,Designation,convert(varchar(11),DOB,106) as DOB from UserDetails";
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
                gvUserDetails.DataSource = dt;
                gvUserDetails.DataBind();
            }
            else
            {
                gvUserDetails.DataSource = null;
                gvUserDetails.DataBind();
            }
        }

        protected void gvUserDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int UserID = int.Parse(gvUserDetails.DataKeys[index]["UserID"].ToString());
                Session["UserID"] = UserID;
                txtCustomerName.Text = gvUserDetails.Rows[index].Cells[0].Text.ToString();
                pnlUserDetails.Visible = false;
                pnlManageUserFees.Visible = true;
                lblFeesPaid.Visible = false;
            }
        }

        protected void ddlMOP_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMOP.SelectedValue == "1")
            {
                pnlManageBank.Visible = false;
            }
            else
            {
                pnlManageBank.Visible = true;
            }
        }
        private void ClearAll()
        {
            txtCustomerName.Text = string.Empty;
            txtFees.Text = string.Empty;
            txtChequeNo.Text = string.Empty;
            txtBranchName.Text = string.Empty;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

        }

        protected void btnback_Click1(object sender, EventArgs e)
        {
            pnlUserDetails.Visible = true;
            pnlManageBank.Visible = false;
            pnlManageUserFees.Visible = false;
        }

        protected void txtCustomerName_TextChanged(object sender, EventArgs e)
        {

        }
    
    }
}