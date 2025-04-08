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
    public partial class ManageCategory : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCategoryDetails();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string categoryName = txtcategoryname.Text.ToString();
            string description = txtDescription.Text.ToString();
            string sQuery = string.Empty;
            if (btnsubmit.Text == "Submit")
            {
                sQuery = "insert into CategoryMaster (CategoryName,Description) values ('" + categoryName + "','" + description + "')";
            }
            else if (btnsubmit.Text == "Update")
            {
                int categoryId = int.Parse(Application["CategoryID"].ToString());
                sQuery = "update CategoryMaster set CategoryName='" + categoryName + "',Description='" + description + "' where CategoryID=" + categoryId;
            }
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuery, _sConn);
            cmd.ExecuteNonQuery();
            _sConn.Close();
            ClearAll();
            pnlAddCategory.Visible = false;
            pnlViewCategory.Visible = true;
            BindCategoryDetails();
        }

        private void ClearAll()
        {
            txtcategoryname.Text = string.Empty;
            txtDescription.Text = string.Empty;
        }

        protected void btnViewCategory_Click(object sender, EventArgs e)
        {
            pnlViewCategory.Visible = true;
            pnlAddCategory.Visible = false;
            BindCategoryDetails();
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            pnlAddCategory.Visible = true;
            pnlViewCategory.Visible = false;
            ClearAll();
            btnsubmit.Text = "Submit";
        }

        private void BindCategoryDetails()
        {
            string sQuery = "select CategoryID,CategoryName,Description from CategoryMaster";
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
                gvCategory.DataSource = dt;
                gvCategory.DataBind();
            }
            else
            {
                gvCategory.DataSource = null;
                gvCategory.DataBind();
            }
        }

        protected void gvCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int categoryID = int.Parse(gvCategory.DataKeys[index]["CategoryID"].ToString());
                Application["CategoryID"] = categoryID;
                txtcategoryname.Text = gvCategory.Rows[index].Cells[0].Text.ToString();
                txtDescription.Text = gvCategory.Rows[index].Cells[1].Text.ToString();

                pnlViewCategory.Visible = false;
                pnlAddCategory.Visible = true;
                btnsubmit.Text = "Update";
            }
        }
    }
}