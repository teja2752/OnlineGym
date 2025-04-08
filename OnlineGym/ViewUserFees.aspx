<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="ViewUserFees.aspx.cs" Inherits="OnlineGym.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">

<h1>View Fees Deetails</h1>
<br />
<br />

<asp:Panel ID="pnlFees" runat="server">
<table width="600" border="5" frame="box" 
        style="color: #000000; font-size: medium; font-weight: bold">
        <tr>
        <td width="120"></td>
        <td width="180"></td>
        <td width="120"></td>
        <td></td>
        </tr>
        <tr>
            <td bgcolor="#42AEFA" width="120">
                Select Year </td>
            <td width="180">
                &nbsp;<asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlYear_SelectedIndexChanged" Width="150px">
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2018">2018</asp:ListItem>
                    <asp:ListItem Value="2019">2019</asp:ListItem>
                    <asp:ListItem Value="2020">2020</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td bgcolor="#42AEFA" width="120">
                Select Month </td>
            <td>
                <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlMonth_SelectedIndexChanged" Width="150px">
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">Octobar</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="120">
                &nbsp;</td>
            <td width="180">
                &nbsp;</td>
            <td width="120">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
</table>

<br />
<br />
<table width="600" border="5" frame="box" 
        style="color: #000000; font-size: medium; font-weight: bold">
<tr>
<td width="120"></td>
<td width="180"></td>
<td width="120"></td>
<td></td>
</tr>




    <tr>
        <td bgcolor="#42AEFA" width="120">
            Paid Amount
        </td>
        <td width="180">
            &nbsp;<asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label></td>
        <td bgcolor="#42AEFA" width="120">
            MOP</td>
        <td>
            <asp:DropDownList ID="ddlMop" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlMop_SelectedIndexChanged" Width="150px">
                <asp:ListItem Value="1">Cash</asp:ListItem>
                <asp:ListItem Value="2">Self Cheque</asp:ListItem>
                <asp:ListItem Value="3">Cross Cheque</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td width="120">
            &nbsp;</td>
        <td width="180">
            &nbsp;</td>
        <td width="120">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>




</table>

<asp:Panel ID="pnlMop" runat="server" Visible="False">
<table width="600" border="5" frame="box" 
        style="color: #000000; font-size: medium; font-weight: bold">
<tr>
<td width="120"></td>
<td width="200"></td>
<td></td>
</tr>

    <tr>
        <td bgcolor="#42AEFA" width="120">
            Bank Name
        </td>
        <td bgcolor="#42AEFA" width="200">
            Branch Name
        </td>
        <td bgcolor="#42AEFA">
            Cheque No</td>
    </tr>
    <tr>
        <td width="120">
            &nbsp;<asp:Label ID="lblBank" runat="server" Text="Label"></asp:Label></td>
        <td width="200">
            &nbsp;<asp:Label ID="lblBranch" runat="server" Text="Label"></asp:Label></td>
        <td>
            &nbsp;<asp:Label ID="lblCheque" runat="server" Text="Label"></asp:Label></td>
    </tr>

</table>
</asp:Panel>

    <br />

</asp:Panel>
</div>
</asp:Content>
