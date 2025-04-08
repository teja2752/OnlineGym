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
    public partial class ManageTimeTable : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Bindcategory();
                BindTimeTable();
             }
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
            ddlcategory.DataSource = dt;
            ddlcategory.DataTextField = "categoryName";
            ddlcategory.DataValueField = "categoryID";
            ddlcategory.DataBind();
            _sConn.Close();
        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string Time = txttime.Text.ToString();
            int CategoryID = int.Parse(ddlcategory.SelectedValue.ToString());
            string sQuey=string.Empty;
            if(btnsubmit.Text=="Submit")
            {
                sQuey = "insert into TimeTable(CategoryID,Time) values(" + CategoryID + ",'" + Time + "')";
            }
            else if (btnsubmit.Text == "Update")
            {
                int TimeTableID = int.Parse(Application["TimeTableID"].ToString());
                sQuey = "update TimeTable set Time='" + Time + "',CategoryID=" + CategoryID + " where TimeTableID=" + TimeTableID;
            }
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd=new SqlCommand(sQuey,_sConn);
            cmd.ExecuteNonQuery();
            _sConn.Close();
            ClearAll();
            pnladdtimetable.Visible = false;
            pnlviewtimetable.Visible = true;
            BindTimeTable();
        }

        private void ClearAll()
        {
            txttime.Text = string.Empty;
        }

        protected void btnviewtimetable_Click(object sender, EventArgs e)
        {
            pnladdtimetable.Visible=false;
            pnlviewtimetable.Visible=true;
            BindTimeTable();
        }

        protected void btnaddtimetable_Click(object sender, EventArgs e)
        {
            pnladdtimetable.Visible=true;
            pnlviewtimetable.Visible=false;
        }

        protected void gvviewtimetable_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Edit")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int categoryID = int.Parse(gvviewtimetable.DataKeys[index]["TimeTableID"].ToString());
                Application["TimeTableID"] = categoryID;
                txttime.Text = gvviewtimetable.Rows[index].Cells[0].Text.ToString();
                pnlviewtimetable.Visible = false;
                pnladdtimetable.Visible = true;
                btnsubmit.Text = "Update";
            }

        }

        protected void gvviewtimetable_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        private void BindTimeTable()
        {
            int categoryId = int.Parse(ddlcategory.SelectedValue.ToString());
            string sQuey = "select TimeTableID,Time from TimeTable where CategoryID=" + categoryId;
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gvviewtimetable.DataSource = dt;
                gvviewtimetable.DataBind();
            }
            else
            {
                gvviewtimetable.DataSource = null;
                gvviewtimetable.DataBind();
            }

        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTimeTable();
        }
 }
}