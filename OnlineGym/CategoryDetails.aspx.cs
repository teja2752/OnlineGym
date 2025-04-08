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
    public partial class CategoryDetails : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);
                
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Bindcategory();
                BindCategoryDetails();
             }
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCategoryDetails();
        }

        private void BindCategoryDetails()
        {
            int categoryId = int.Parse(ddlcategory.SelectedValue.ToString());
            string sQuery = "select CategoryDetaillID,DetailName,Description from CategoryDetail where CategoryID="+categoryId;
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
                gvcategorydetails.DataSource = dt;
                gvcategorydetails.DataBind();
            }
            else
            {
                lblnorecords.Visible = true;
                gvcategorydetails.DataSource = null;
                gvcategorydetails.DataBind();
            }
        }

        private void Bindcategory()
        {
            if(_sConn.State != ConnectionState.Open)
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
            string categorydetails = txtcategorydetails.Text.ToString();
            string description = txtdescription.Text.ToString();
            int categoryID = int.Parse(ddlcategory.SelectedValue.ToString());
            string sQuey=string.Empty;
            if(btnsubmit.Text=="Submit")
            {
               sQuey = "insert into CategoryDetail (CategoryID,DetailName,Description) values (" + categoryID + ",'" + categorydetails + "','" + description + "')";

            }
            else if (btnsubmit.Text == "Update")
            {
                int categoryDetailId = int.Parse(Application["CategoryDetaillID"].ToString());
                sQuey = "update CategoryDetail set DetailName='" + categorydetails + "',Description='" + description + "' where CategoryDetaillID=" + categoryDetailId;
            }
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            cmd.ExecuteNonQuery();
            _sConn.Close();
            ClearAll();
            pnladdcategory.Visible = false;
            pnlviewcategory.Visible = true;
            BindCategoryDetails();
        }

        private void ClearAll()
        {
            txtdescription.Text = string.Empty;
            txtcategorydetails.Text = string.Empty;
        }

        protected void btnviewcategory_Click(object sender, EventArgs e)
        {
            pnladdcategory.Visible = false;
            pnlviewcategory.Visible = true;
         
            BindCategoryDetails();
        }

        protected void btnaddcategory_Click(object sender, EventArgs e)
        {
            pnlviewcategory.Visible = false;
            pnladdcategory.Visible = true;
            ClearAll();
            btnsubmit.Text = "Submit";
        }

        protected void gvcategorydetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int categoryID = int.Parse(gvcategorydetails.DataKeys[index]["CategoryDetaillID"].ToString());
                Application["CategoryDetaillID"] = categoryID;
                txtcategorydetails.Text = gvcategorydetails.Rows[index].Cells[0].Text.ToString();
                txtdescription.Text = gvcategorydetails.Rows[index].Cells[1].Text.ToString();

                pnlviewcategory.Visible = false;
                pnladdcategory.Visible = true;
                btnsubmit.Text = "Update";
            }
        }

        protected void gvcategorydetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvcategorydetails_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
   
    }
}