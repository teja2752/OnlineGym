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
    public partial class DailyWorkoutReport : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                BindAllUsers();
                BindDailyWorkout();
            }

        }

        private void BindAllUsers()
        {
            string sQuery = "select UserID,FullName,MobileNo,Designation,convert(varchar(11),DOB,106) as DOB,City from UserDetails";
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

        private void BindUserDetails()
        {
            int userId = int.Parse(Session["UserID"].ToString());
            string sQuery="select FullName,MobileNo,EmailID,Address from UserDetails where UserID="+userId;
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
                    txtusername.Text = dr["FullName"].ToString();
                    txtmobileno.Text = dr["MobileNo"].ToString();
                    txtemailid.Text = dr["EmailID"].ToString();
                    txtaddress.Text = dr["Address"].ToString();
                }
            }
        }


        protected void gvUserDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int UserID = int.Parse(gvUserDetails.DataKeys[index]["UserID"].ToString());
                Session["UserID"] = UserID;
                BindDailyWorkout();
                BindUserDetails();
                pnlUserDetails.Visible = false;
                pnlDailyWorkout.Visible = true;
               }
        }



        private void BindDailyWorkout()
        {
            if (Session["UserID"] != null)
            {
                int userId = int.Parse(Session["UserID"].ToString());
                string sQuery = "select a.DailyWorkoutID,b.CategoryID,b.CategoryName,c.TrainerName,a.Description,d.Time from DailyWorkout a join CategoryMaster b on a.CategoryID=b.CategoryID join TrainerDetails c on a.TrainerID=c.TrainerID join TimeTable d on a.TimeTableID=d.TimeTableID where a.UserID=" + userId;
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
                    lblnorecords.Visible = false;
                    gvDailyWorkout.DataSource = dt;
                    gvDailyWorkout.DataBind();
                }
                else
                {
                    lblnorecords.Visible = true;
                    gvDailyWorkout.DataSource = null;
                    gvDailyWorkout.DataBind();
                }
            }
        }
            

        protected void gvDailyWorkout_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvDailyWorkout_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int DailyWorkoutID = int.Parse(gvDailyWorkout.DataKeys[index]["DailyWorkoutID"].ToString());
                Session["DailyWorkoutID"] = DailyWorkoutID;
                int CategoryID = int.Parse(gvDailyWorkout.DataKeys[index]["CategoryID"].ToString());
                Session["CategoryID"] = CategoryID;

                pnlUserDetails.Visible = false;
                pnlDailyWorkout.Visible = true;
                BindDailyWorkoutDetails();

            }
        }


        private void BindDailyWorkoutDetails()
        {
            int DailyWorkoutID = int.Parse(Session["DailyWorkoutID"].ToString());
            string sQuery = "select a.CategoryDetailID,c.DetailName from DailyWorkoutDetails a join DailyWorkout b on a.DailyWorkoutID=b.DailyWorkoutID join CategoryDetail c on a.CategoryDetailID = c.CategoryDetaillID where a.DailyWorkoutID="+DailyWorkoutID;
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
                cblSubCat.DataSource = dt;
                cblSubCat.DataTextField = "DetailName";
                cblSubCat.DataValueField = "CategoryDetailID";
                cblSubCat.DataBind();
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            pnlUserDetails.Visible = true;
            pnlDailyWorkout.Visible = false;
            cblSubCat.Items.Clear();
        }
    }
}