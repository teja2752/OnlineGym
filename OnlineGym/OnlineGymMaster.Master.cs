using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineGym
{
    public partial class OnlineGymMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liCategory.Visible = false;
            liCategoryDet.Visible = false;
            liFees.Visible = false;
            liTimeTable.Visible = false;
            liTrainer.Visible = false;
            liUser.Visible = false;
            liManageDWO.Visible = false;
            liViewDailyWO.Visible = false;
            liViewFees.Visible = false;
            liViewUserDWO.Visible = false;

            if (Session["LoggedUser"] != null)
            {
                lbLogin.Text = "Logout";
                string loggedUser = Session["LoggedUser"].ToString();
                if (loggedUser == "Admin")
                {
                    liCategory.Visible = true;
                    liCategoryDet.Visible = true;
                    liFees.Visible = true;
                    liTimeTable.Visible = true;
                    liTrainer.Visible = true;
                    liUser.Visible = true;
                    liViewDailyWO.Visible = true;                    
                }
                else if (loggedUser == "Trainer")
                {
                    liCategory.Visible = true;
                    liCategoryDet.Visible = true;
                    liFees.Visible = true;
                    liTimeTable.Visible = true;
                    liUser.Visible = true;
                    liViewDailyWO.Visible = true;
                    liManageDWO.Visible = true;
                }
                else if (loggedUser == "User")
                {
                    liViewFees.Visible = true;
                    liViewUserDWO.Visible = true;
                }
            }
            else
            {
                lbLogin.Text = "Login";
            }
        }

        protected void lbLogin_Click(object sender, EventArgs e)
        {
            if (lbLogin.Text == "Login")
            {
                Response.Redirect("LoginPage.aspx");
            }
            else if (lbLogin.Text == "Logout")
            {
                Response.Redirect("Logout.aspx");
            }
        }
    }
}