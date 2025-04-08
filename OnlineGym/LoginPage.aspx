<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="OnlineGym.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div align="center">
<br /><br /><br />
<h1>LOGIN PAGE</h1>
<br /><br />
<table width="400"  border="5" frame="box" 
        style="color: #000000; font-weight: bold">
<tr>
<td>&nbsp;</td>

<td>&nbsp;</td>
</tr>

<tr>
<td>User Type</td>

<td>
    <asp:DropDownList ID="ddlUserType" runat="server" Width="200px">
        <asp:ListItem>Admin</asp:ListItem>
        <asp:ListItem>Trainer</asp:ListItem>
        <asp:ListItem>User</asp:ListItem>
    </asp:DropDownList>
    </td>
</tr>
<tr>
<td></td>

<td>&nbsp;</td>
</tr>

<tr>
<td class="style1">User Name</td>

<td class="style1">
    <asp:TextBox ID="txtUsername" runat="server" Width="200px"></asp:TextBox>
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
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
    </td>
</tr>
<tr>
<td>&nbsp;</td>

<td>
    <asp:Label ID="lblInvalid" runat="server" ForeColor="Red" Text="Invalid Login" 
        Visible="False"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtpassword" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td>&nbsp;</td>

<td>
    <asp:Button ID="btnLogin" runat="server" Text="Login" Width="100px" 
        onclick="btnLogin_Click" Font-Bold="True" />
    </td>
</tr>

</table>
<br /><br /><br /><br /><br />
</div>

</asp:Content>
