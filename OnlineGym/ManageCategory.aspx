<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="ManageCategory.aspx.cs" Inherits="OnlineGym.ManageCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>
<div align="center">
<br />
<br />
<h1 align="center">Manage Category</h1>
<br />
    <asp:Button ID="btnViewCategory" runat="server" Text="View Category" 
        onclick="btnViewCategory_Click" CausesValidation="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" 
        onclick="btnAddCategory_Click" CausesValidation="False" />
<br /><br />


    <asp:Panel ID="pnlAddCategory" runat="server" Visible="False">
<table width="400" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
<tr>
<td></td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Category Name</td>
<td>
    <asp:TextBox ID="txtcategoryname" runat="server" Height="22px"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtcategoryname">
    </asp:FilteredTextBoxExtender>
    </td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Enter Category Name" ForeColor="Red" 
        ControlToValidate="txtcategoryname"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td>Description</td>
<td>
    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtDescription">
    </asp:FilteredTextBoxExtender>
    </td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Enter Description" ForeColor="Red" 
        ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="left">
    <asp:Button ID="btnsubmit" runat="server" onclick="btnsubmit_Click" 
        Text="Submit" Width="116px" Font-Bold="True" />
    </td>
</tr>
</table>
    </asp:Panel>
    <asp:Panel ID="pnlViewCategory" runat="server">
        <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" Width="500px" 
            DataKeyNames="CategoryID" onrowcommand="gvCategory_RowCommand" 
            onrowediting="gvCategory_RowEditing">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Category_Name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="Description" HeaderText="Category_Description" 
                    ReadOnly="True" />
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

<br />
</div>
</asp:Content>
