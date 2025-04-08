using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace OnlineGym
{
    public partial class ManageTrainers : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindTrainerDetails();
                Bindcategory();
                BindTimeTable();

            }
        }

        protected void gvviewtrainers_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvviewtrainers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                
                int index=int.Parse(e.CommandArgument.ToString());
                int TrainerID = int.Parse(gvtrainerdetails.DataKeys[index]["TrainerID"].ToString());
                Application["TrainerID"] = TrainerID;
                BindTrainerDetails(TrainerID);
                pnlviewtrainers.Visible = false;
                pnladdtrainers.Visible = true;
                btnsubmit.Text = "Update";
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string trainerName = txttrainername.Text.ToString();
            string contactNo = txtcontactno.Text.ToString();
            string emailId = txtemailid.Text.ToString();
            string password = txtpassword.Text.ToString();
            string city = txtcity.Text.ToString();
            string address = txtaddress.Text.ToString();
            int categoryId = int.Parse(ddlcategoryid.SelectedValue.ToString());
            int timetableId = int.Parse(ddltimetableid.SelectedValue.ToString());
            string sQuery = string.Empty;

            if (btnsubmit.Text == "Submit")
            {
                sQuery = "insert into TrainerDetails(TrainerName,ContactNo,Email,Password,City,Address,CategoryID,TimeTableID) values ('" + trainerName + "','" + contactNo + "','" + emailId + "','" + password + "','" + city + "','" + address + "'," + categoryId + "," + timetableId + ")";
            }
            else if (btnsubmit.Text == "Update")
            {
                int TrainerID=int.Parse(Application["TrainerID"].ToString());
                sQuery="update TrainerDetails set TrainerName='"+trainerName+"',ContactNo='"+contactNo+"',Email='"+emailId+"',Password='"+password+"',City='"+city+"',Address='"+address+"',CategoryID="+categoryId+",TimeTableID="+timetableId+"where TrainerID="+TrainerID;
            }
            
            if(_sConn.State!=ConnectionState.Open)

            {
                _sConn.Open();
            
            }
            SqlCommand cmd=new SqlCommand(sQuery,_sConn);
            cmd.ExecuteNonQuery();
            _sConn.Close();
            ClearAll();
            pnladdtrainers.Visible=false;
            pnlviewtrainers.Visible=true;
            BindTrainerDetails();
        }

        private void ClearAll()
        {
            txttrainername.Text = string.Empty;
            txtcontactno.Text = string.Empty;
            txtemailid.Text = string.Empty;
            txtpassword.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtaddress.Text = string.Empty;
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            ClearAll();
        }


        private void BindTrainerDetails()
        {
            string sQuery = "select TrainerID,TrainerName,ContactNo,Email,City from TrainerDetails";
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
                gvtrainerdetails.DataSource = dt;
                gvtrainerdetails.DataBind();
            }
            else
            {
                gvtrainerdetails.DataSource = null;
                gvtrainerdetails.DataBind();
            }
        }


        private void BindTrainerDetails(int TrainerID)
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            string sQuey = "select TrainerName,ContactNo,Email,Password,City,Address,CategoryID,TimetableID from TrainerDetails where TrainerID=" + TrainerID;
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    txttrainername.Text = dr["TrainerName"].ToString();
                    txtcontactno.Text = dr["ContactNo"].ToString();
                    txtemailid.Text = dr["Email"].ToString();
                    txtpassword.Text = dr["Password"].ToString();
                    txtcity.Text = dr["City"].ToString();
                    txtaddress.Text = dr["Address"].ToString();
                    ddlcategoryid.SelectedValue = dr["CategoryID"].ToString();
                    ddltimetableid.SelectedValue = dr["TimeTableID"].ToString();
                }
            }
        }


        private void BindTimeTable()
        {
            if (_sConn.State != ConnectionState.Open)
                {
                    _sConn.Open();
                }
                string sQuey = "select TimeTableID,Time from TimeTable";
                SqlCommand cmd = new SqlCommand(sQuey, _sConn);
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                ddltimetableid.DataSource = dt;
                ddltimetableid.DataTextField = "Time";
                ddltimetableid.DataValueField = "TimeTableID";
                ddltimetableid.DataBind();
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
            ddlcategoryid.DataSource = dt;
            ddlcategoryid.DataTextField = "categoryName";
            ddlcategoryid.DataValueField = "categoryID";
            ddlcategoryid.DataBind();
            _sConn.Close();

        }

        protected void btnviewtrainers_Click(object sender, EventArgs e)
        {
            pnladdtrainers.Visible = false;
            pnlviewtrainers.Visible = true;
        }

        protected void btnaddtrainers_Click(object sender, EventArgs e)
        {
            pnlviewtrainers.Visible = false;
            pnladdtrainers.Visible = true;
        }
    }
}