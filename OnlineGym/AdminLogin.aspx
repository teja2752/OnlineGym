<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="OnlineGym.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        height: 26px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div align="center">
<br /><br /><br />
<h1>Admin Login Page</h1>
<br /><br />
<table width="400" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
<tr>
<td></td>

<td>&nbsp;</td>
</tr>



<tr>
<td class="style1">User Name</td>

<td class="style1">
    <asp:TextBox ID="txtusername" runat="server" Width="200px"></asp:TextBox>
    </td>
</tr>



<tr>
<td>&nbsp;</td>

<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtusername" ErrorMessage="Enter User Name" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>



<tr>
<td>Password</td>

<td>
    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
    </td>
</tr>



<tr>
<td>&nbsp;</td>

<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtpassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>



<tr>
<td>&nbsp;</td>

<td align="left">
    <asp:Button ID="btnlogin" runat="server" Text="Login" Width="100px" 
        Font-Bold="True" />
    </td>
</tr>



</table>
<br /><br /><br /><br /><br />
</div>

</asp:Content>
