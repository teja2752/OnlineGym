<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="AddUserDetails.aspx.cs" Inherits="OnlineGym.AddUserDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
        .style2
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>


    <br />

<div align="center">
<h1>Manage User Details</h1>
<br/>
<br/>
    <p>
        <asp:Button ID="btnviewuserdetails" runat="server" Text="View User Details" 
            onclick="btnviewuserdetails_Click" CausesValidation="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnadduserdetails" runat="server" Text="Add User Details" 
            onclick="btnadduserdetails_Click" CausesValidation="False" />
    </p>
<br />
<br />
    <asp:Panel ID="pnladduserdetails" runat="server" Visible="False">
    
<table width="800" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
<tr>
<td align="left"></td>
<td></td>
<td align="left"></td>
<td></td>
</tr>
<tr>
<td align="left">FullName</td>
<td>
    <asp:TextBox ID="txtfullname" runat="server" Width="200px"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" 
        TargetControlID="txtfullname">
    </asp:FilteredTextBoxExtender>
    </td>
<td align="left">E-mail ID</td>
<td>
    <asp:TextBox ID="txtemail" runat="server" Width="200px"></asp:TextBox>
    </td>
</tr>
<tr>
<td align="left" class="style1"></td>
<td class="style1">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Enter Fullname" ForeColor="Red" 
        ControlToValidate="txtfullname"></asp:RequiredFieldValidator>
    </td>
<td align="left" class="style1"></td>
<td class="style1">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter Email" ForeColor="Red" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td align="left">Password</td>
<td>
    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
    </td>
<td align="left">Confirm Password</td>
<td>
    <asp:TextBox ID="txtconfirmpassword" runat="server" TextMode="Password" 
        Width="200px"></asp:TextBox>
    </td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Enter Password" ForeColor="Red" 
        ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
    </td>
<td align="left">&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="left">Country</td>
<td>
    <asp:DropDownList ID="ddlcountry" runat="server" Width="200px" 
        AutoPostBack="True" onselectedindexchanged="ddlcountry_SelectedIndexChanged">
    </asp:DropDownList>
    </td>
<td align="left">State</td>
<td>
    <asp:DropDownList ID="ddlstate" runat="server" Width="200px" >
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Select Country" ForeColor="Red" 
        ControlToValidate="ddlcountry"></asp:RequiredFieldValidator>
    </td>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="Select State" ForeColor="Red" ControlToValidate="ddlstate"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td align="left">DOB</td>
<td>
    <asp:TextBox ID="txtdob" runat="server" Width="200px"></asp:TextBox>
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtdob" Format="dd/MMM/yyyy">
    </asp:CalendarExtender>
    </td>
<td align="left">Address</td>
<td>
    <asp:TextBox ID="txtaddress" runat="server" Width="200px"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtaddress">
    </asp:FilteredTextBoxExtender>
    </td>
</tr>
<tr>
<td align="left" class="style1"></td>
<td class="style1">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ErrorMessage="Select Date of birth" ForeColor="Red" 
        ControlToValidate="txtdob"></asp:RequiredFieldValidator>
    </td>
<td align="left" class="style1"></td>
<td class="style1">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ErrorMessage="Enter Address" ForeColor="Red" 
        ControlToValidate="txtaddress"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td align="left">City</td>
<td>
    <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtcity">
    </asp:FilteredTextBoxExtender>
    </td>
<td align="left">Mobile No</td>
<td>
    <asp:TextBox ID="txtmobileno" runat="server" Width="200px" MaxLength="11" 
        style="height: 22px"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
        FilterType="Numbers" TargetControlID="txtmobileno">
    </asp:FilteredTextBoxExtender>
    </td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
        ErrorMessage="Enter City" ForeColor="Red" ControlToValidate="txtcity"></asp:RequiredFieldValidator>
    </td>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
        ErrorMessage="Enter Mobile No" ForeColor="Red" 
        ControlToValidate="txtmobileno"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td align="left" class="style2">Height</td>
<td class="style2">
    <asp:TextBox ID="txtheight" runat="server" Width="200px" 
        ontextchanged="txtheight_TextChanged"></asp:TextBox>
    </td>
<td align="left" class="style2">Weight (KG)</td>
<td class="style2">
    <asp:TextBox ID="txtweight" runat="server" Width="200px"></asp:TextBox>
    </td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
        ErrorMessage="Enter Height" ForeColor="Red" ControlToValidate="txtheight"></asp:RequiredFieldValidator>
    </td>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
        ErrorMessage="Enter Weight" ForeColor="Red" ControlToValidate="txtweight"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td align="left">Designation</td>
<td>
    <asp:TextBox ID="txtdesignation" runat="server" Width="200px"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtdesignation">
    </asp:FilteredTextBoxExtender>
    </td>
<td align="left">Timetable</td>
<td>
    <asp:DropDownList ID="ddltimetable" runat="server" Width="200px" >
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
        ErrorMessage="Enter Designation" ForeColor="Red" 
        ControlToValidate="txtdesignation"></asp:RequiredFieldValidator>
    </td>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
        ErrorMessage="Select Timings" ForeColor="Red" 
        ControlToValidate="ddltimetable"></asp:RequiredFieldValidator>
    </td>
</tr>
    <tr>
        <td align="left">
            User Image</td>
        <td>
            <asp:FileUpload ID="fuUserImage" runat="server" Width="200px" />
        </td>
        <td align="left">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left">
            &nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                ErrorMessage="Upload Image" ForeColor="Red" 
                ControlToValidate="fuUserImage"></asp:RequiredFieldValidator>
        </td>
        <td align="left">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="100px" 
        onclick="btnsubmit_Click" Font-Bold="True" />
    </td>
<td align="right">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnreset" runat="server" Text="Reset" Width="100px" 
        onclick="btnreset_Click" CausesValidation="False" Font-Bold="True" />
    </td>
<td>
    &nbsp;</td>
</tr>
</table>

</asp:Panel>

 <asp:Panel ID="pnlviewuserdetails" runat="server">
     <asp:GridView ID="gvuserdetails" runat="server" AutoGenerateColumns="False" 
         CellPadding="4" DataKeyNames="UserID" ForeColor="#333333" Width="800px" 
         onrowcommand="gvuserdetails_RowCommand" onrowediting="gvuserdetails_RowEditing">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>
             <asp:BoundField DataField="FullName" HeaderText="Full Name" ReadOnly="True" />
             <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" ReadOnly="True" />
             <asp:BoundField DataField="City" HeaderText="City" ReadOnly="True" />
             <asp:BoundField DataField="Designation" HeaderText="Designation" 
                 ReadOnly="True" />
             <asp:BoundField DataField="EmailID" HeaderText="Email ID" ReadOnly="True" />
             <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Edit" />
         </Columns>
         <EditRowStyle BackColor="#999999" />
         <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
         <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
         <SortedAscendingCellStyle BackColor="#E9E7E2" />
         <SortedAscendingHeaderStyle BackColor="#506C8C" />
         <SortedDescendingCellStyle BackColor="#FFFDF8" />
         <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
     </asp:GridView>

 </asp:Panel>


</div>

<br /><br />
</asp:Content>
