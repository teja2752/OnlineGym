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
    public partial class ManageDailyWorkout : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                tblDailyWorkout.Visible = false;
                BindTime();
                BindUsers();
                Bindcategory();
            }
        }

        private void BindUsers()
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            string sQuey = "select UserID,FullName,Address,MobileNo,EmailID from UserDetails";
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
            _sConn.Close();
        }

        private void BindTime()
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            string sQuey = "select Time,TimeTableID  from TimeTable";
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ddlTime.DataSource = dt;
            ddlTime.DataTextField = "Time";
            ddlTime.DataValueField = "TimeTableID";
            ddlTime.DataBind();
            _sConn.Close();
        }

        private void Bindcategory()
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            string sQuey = "select CategoryID,CategoryName from CategoryMaster";
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataTextField = "categoryName";
            ddlCategory.DataValueField = "categoryID";
            ddlCategory.DataBind();
            _sConn.Close();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCategory();
        }

        private void BindSubCategory()
        {
            int categoryId = int.Parse(ddlCategory.SelectedValue.ToString());
            string sQuery = "select CategoryDetaillID,DetailName from CategoryDetail where CategoryID=" + categoryId;
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuery, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cblSubCat.DataSource = dt;
            cblSubCat.DataTextField = "DetailName";
            cblSubCat.DataValueField = "CategoryDetaillID";
            cblSubCat.DataBind();
            _sConn.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int userId = int.Parse(Session["UserID"].ToString());
            int trainerID = int.Parse(Session["TrainerID"].ToString());
            int categoryID = int.Parse(ddlCategory.SelectedValue.ToString());
            int timeTableID = int.Parse(ddlTime.SelectedValue.ToString());
            string workoutDate = DateTime.Parse(txtWODate.Text.ToString()).ToString("MM/dd/yyyy");
            string description = txtDescription.Text.ToString();
            string sQuey = string.Empty;
            if (btnSubmit.Text == "Submit")
            {
                sQuey = "insert into DailyWorkout (CategoryID,Description,TrainerID,UserID,WorkoutDate,TimeTableID) output inserted.DailyWorkoutID values (" + categoryID + ",'" + description + "'," + trainerID + "," + userId + ",'" + workoutDate + "'," + timeTableID + ")";
            }
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            int dailyWorkoutId = int.Parse(cmd.ExecuteScalar().ToString());
            for (int i = 0; i < cblSubCat.Items.Count; i++)
            {
                if (cblSubCat.Items[i].Selected == true)
                {
                    int subCategoryId = int.Parse(cblSubCat.Items[i].Value.ToString());
                    sQuey = "insert into DailyWorkoutDetails (CategoryDetailID,DailyWorkoutID) values (" + subCategoryId + "," + dailyWorkoutId + ")";
                    cmd = new SqlCommand(sQuey, _sConn);
                    cmd.ExecuteNonQuery();
                }
            }
            cmd.ExecuteNonQuery();
            _sConn.Close();
            ClearAll();
        }


        private void ClearAll()
        {
            txtDescription.Text = string.Empty;
            ddlCategory.SelectedValue = "0";
            cblSubCat.Items.Clear();
            ddlTime.SelectedValue="0";
            tblDailyWorkout.Visible = false;
            gvUsers.Visible = true;            
        }

        protected void txtDescription_TextChanged(object sender, EventArgs e)
        {

        }

        protected void cblSubCat_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int userId = int.Parse(gvUsers.DataKeys[index]["UserID"].ToString());
                Session["UserID"] = userId;
                gvUsers.Visible = false;
                tblDailyWorkout.Visible = true;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            gvUsers.Visible = true;
            tblDailyWorkout.Visible = false;
        }
    }
}