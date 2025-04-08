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
    public partial class AddUserDetails : System.Web.UI.Page
    {
        SqlConnection _sConn = new SqlConnection(ConfigurationManager.ConnectionStrings["GYM"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCountry();
                BindState();
                BindTimetable();
                BindUserDetails();
            }
        }

        private void BindCountry()
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            string sQuey = "select CountryID,CountryName from CountryMaster";
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ddlcountry.DataSource = dt;
            ddlcountry.DataTextField = "CountryName";
            ddlcountry.DataValueField = "CountryID";
            ddlcountry.DataBind();
            _sConn.Close();
        }

        private void BindState()
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            int countryId = int.Parse(ddlcountry.SelectedValue.ToString());
            string sQuey = "select StateID,StateName from StateMaster where CountryId=" + countryId;
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ddlstate.DataSource = dt;
            ddlstate.DataTextField = "StateName";
            ddlstate.DataValueField = "StateID";
            ddlstate.DataBind();
            _sConn.Close();

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string fullName = txtfullname.Text.ToString();
            string password = txtpassword.Text.ToString();
            string address = txtaddress.Text.ToString();
            string city = txtcity.Text.ToString();
            string mobileno = txtmobileno.Text.ToString();
            string height = txtheight.Text.ToString();
            string weight = txtweight.Text.ToString();
            string designation = txtdesignation.Text.ToString();
            string emailID = txtemail.Text.ToString();
            int countryID = int.Parse(ddlcountry.SelectedValue.ToString());
            int stateID = int.Parse(ddlstate.SelectedValue.ToString());
            int timeTable = int.Parse(ddltimetable.SelectedValue.ToString());
            DateTime dob = DateTime.Parse(txtdob.Text.ToString());

            string imageName = string.Empty;
            string sQuery = string.Empty;

            if (fuUserImage.HasFile)
            {
                imageName = Path.GetFileName(fuUserImage.FileName);
                fuUserImage.SaveAs(Server.MapPath("~/UserImage/") + imageName);
            }

            if (btnsubmit.Text == "Submit")
            {
                sQuery = "insert into UserDetails(FullName,Password,Address,MobileNo,EmailID,DOB,CountryID,StateID,City,Height,Weight,Designation,TimetableID,UserImage) values ('" + fullName + "','" + password + "','" + address + "','" + mobileno + "','" + emailID + "','" + dob + "'," + countryID + "," + stateID + ",'" + city + "','" + height + "','" + weight + "','" + designation + "'," + timeTable + ",'" + imageName + "')";
            }
            else if (btnsubmit.Text == "Update")
            {
                int UserID = int.Parse(Application["UserID"].ToString());
                sQuery = "update UserDetails set FullName='" + fullName + "',Password='" + password + "',Address='" + address + "',MobileNo='" + mobileno + "',EmailID='" + emailID + "',DOB='" + dob + "',CountryID=" + countryID + ",StateID=" + stateID + ",City='" + city + "',Height='" + height + "',Weight='" + weight + "',Designation='" + designation + "',TimetableID=" + timeTable + ",UserImage='" + imageName + "' where UserId="+UserID;
            } 
            
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            SqlCommand cmd = new SqlCommand(sQuery, _sConn);
            cmd.ExecuteNonQuery();
            _sConn.Close();
            ClearAll();
            pnladduserdetails.Visible = false;
            pnlviewuserdetails.Visible = true;
            BindUserDetails();
        }
        

        protected void ddlcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindState();
        }

        private void BindTimetable()
        {
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
                ddltimetable.DataSource = dt;
                ddltimetable.DataTextField = "Time";
                ddltimetable.DataValueField = "TimeTableID";
                ddltimetable.DataBind();
                _sConn.Close();
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            ClearAll();
        }

        private void ClearAll()
        {
            txtaddress.Text = string.Empty;
            txtcity.Text = string.Empty;
            txtdesignation.Text = string.Empty;
            txtdob.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtfullname.Text = string.Empty;
            txtheight.Text = string.Empty;
            txtmobileno.Text = string.Empty;
            txtweight.Text = string.Empty;
            
 
        }

        private void BindUserDetails()
        {
            string sQuery = "select FullName,UserID,MobileNo,EmailID,City,Designation from UserDetails";
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
                gvuserdetails.DataSource = dt;
                gvuserdetails.DataBind();
            }
            else
            {
                gvuserdetails.DataSource = null;
                gvuserdetails.DataBind();
            }

        }

        protected void btnviewuserdetails_Click(object sender, EventArgs e)
        {
            pnladduserdetails.Visible = false;
            pnlviewuserdetails.Visible = true;
            BindUserDetails();
        }

        protected void btnadduserdetails_Click(object sender, EventArgs e)
        {
            pnladduserdetails.Visible = true;
            pnlviewuserdetails.Visible =false;
            ClearAll();
            btnsubmit.Text = "Submit";

        }

        protected void gvuserdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                int UserID = int.Parse(gvuserdetails.DataKeys[index]["UserID"].ToString());
                Application["UserID"] = UserID;
                BindUserDetails(UserID);
                pnlviewuserdetails.Visible = false;
                pnladduserdetails.Visible = true;
                btnsubmit.Text = "Update";
            }
        }

        private void BindUserDetails(int UserId)
        {
            if (_sConn.State != ConnectionState.Open)
            {
                _sConn.Open();
            }
            string sQuey = "select FullName,Address,MobileNo,EmailID,DOB,CountryID,StateID,City,Height,Weight,Designation,TimetableID from UserDetails where UserID=" + UserId;
            SqlCommand cmd = new SqlCommand(sQuey, _sConn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    txtaddress.Text = dr["Address"].ToString();
                    ddlcountry.SelectedValue = dr["CountryID"].ToString();
                    BindState();
                    ddlstate.SelectedValue = dr["StateID"].ToString();
                    txtfullname.Text = dr["FullName"].ToString();
                    txtmobileno.Text = dr["MobileNo"].ToString();
                    txtemail.Text = dr["EmailID"].ToString();
                    txtdob.Text = dr["DOB"].ToString();
                    txtcity.Text = dr["City"].ToString();
                    txtheight.Text = dr["Height"].ToString();
                    txtweight.Text = dr["Weight"].ToString();
                    txtdesignation.Text = dr["Designation"].ToString();
                    ddltimetable.SelectedValue = dr["TimeTableId"].ToString();
                    
                }
            }
        }

        protected void gvuserdetails_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void txtheight_TextChanged(object sender, EventArgs e)
        {

        }

    }
}