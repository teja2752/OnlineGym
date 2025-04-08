<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="OnlineGym.CategoryDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>

<div align="center">
<h1>Manage Category Details</h1>
<br />
<br />


    
    <asp:Button ID="btnviewcategory" runat="server" Text="View Category" 
        onclick="btnviewcategory_Click" CausesValidation="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnaddcategory" runat="server" Text="Add Category" 
        onclick="btnaddcategory_Click" CausesValidation="False" />


    <br />
<br />
    Select Category
    <asp:DropDownList ID="ddlcategory" runat="server" 
        onselectedindexchanged="ddlcategory_SelectedIndexChanged" Width="150px" 
        Height="16px" AutoPostBack="True" >
    </asp:DropDownList>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="select Category" ForeColor="Red" 
        ControlToValidate="ddlcategory"></asp:RequiredFieldValidator>
<br />
<br />
<br />



    <asp:Panel ID="pnladdcategory" runat="server" Visible="False">
    
<table width="400px" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
    <tr>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>
            Category Details</td>
        <td>
            <asp:TextBox ID="txtcategorydetails" runat="server" ></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                FilterType="LowercaseLetters,UppercaseLetters" TargetControlID="txtcategorydetails">
            </asp:FilteredTextBoxExtender>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Enter Category Details" ForeColor="Red" 
                ControlToValidate="txtcategorydetails"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Description</td>
        <td>
            <asp:TextBox ID="txtdescription" runat="server" ></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
                FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtdescription">
            </asp:FilteredTextBoxExtender>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Enter Description" ForeColor="Red" 
                ControlToValidate="txtdescription"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="left">
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                onclick="btnsubmit_Click" Font-Bold="True" />
        </td>
    </tr>
</table>
    </asp:Panel>

    


    <asp:Panel ID="pnlviewcategory" runat="server">

    

    


    <asp:GridView ID="gvcategorydetails" runat="server" CellPadding="4" 
            ForeColor="#333333" Width="500px" 
            AutoGenerateColumns="False" DataKeyNames="CategoryDetaillID" 
            onrowcommand="gvcategorydetails_RowCommand" 
            onrowediting="gvcategorydetails_RowEditing" 
            onselectedindexchanged="gvcategorydetails_SelectedIndexChanged" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="DetailName" HeaderText="Category Details" 
                ReadOnly="True" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
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
        <asp:Label ID="lblnorecords" runat="server" Text="No Records Found" 
            Font-Bold="True" Font-Size="XX-Large" ForeColor="Red" Visible="False"></asp:Label>

    </asp:Panel>
    <br />
    <br />

    </div>

</asp:Content>
