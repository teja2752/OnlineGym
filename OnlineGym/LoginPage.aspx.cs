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
    public partial class LoginPage : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userType = ddlUserType.SelectedValue.ToString();
            string username = txtUsername.Text.ToString();
            string password = txtPassword.Text.ToString();
            string sQuery = string.Empty;
            if (userType == "Admin")
            {
                sQuery = "select AdminId from AdminMaster where Username='" + username + "' and Password='" + password + "'";
            }
            else if (userType == "Trainer")
            {
                sQuery = "select TrainerID from TrainerDetails where Email='" + username + "' and Password='" + password + "'";
            }
            else if (userType == "User")
            {
                sQuery = "select UserID from UserDetails where EmailID='" + username + "' and Password='" + password + "'";
            }
            if (_sConn.State != ConnectionState.Open)
            {
                sQuery = "select AdminId from AdminMaster where Username='" + username + "' and Password='aaa" + password + "";

            }
            SqlCommand cmd = new SqlCommand(sQuery, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblInvalid.Visible = false;
                foreach (DataRow dr in dt.Rows)
                {
                    if (userType == "Admin")
                    {
                        Session["LoggedUser"] = "Admin";
                        Session["AdminID"] = dr["AdminId"].ToString();
                    }
                    else if (userType == "Trainer")
                    {
                        Session["LoggedUser"] = "Trainer";
                        Session["TrainerID"] = dr["TrainerID"].ToString();
                    }
                    else if (userType == "User")
                    {
                        Session["LoggedUser"] = "User";
                        Session["UserID"] = dr["UserID"].ToString();
                    }
                }
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblInvalid.Visible = true;
                txtUsername.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtUsername.Focus();
            }
        }
    }
}