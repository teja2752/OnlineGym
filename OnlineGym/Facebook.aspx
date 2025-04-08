<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="Facebook.aspx.cs" Inherits="OnlineGym.Facebook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br /><br />
<center>
<asp:Button ID="btnLogin" runat="server" Text="Login with FaceBook" OnClick="Login" />
<asp:Panel ID="pnlFaceBookUser" runat="server" Visible="false">
<hr />
<table width="400px">
    <tr>
        <td rowspan="5" valign="top">
            <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
        </td>
    </tr>
    <tr>
        <td height="40px">ID:<asp:Label ID="lblId" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td height="40px">UserName:<asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td height="40px">Name:<asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td height="40px">Email:<asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
    </tr>
</table>
</asp:Panel>
</center>
</asp:Content>
