<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="ManageTimeTable.aspx.cs" Inherits="OnlineGym.ManageTimeTable" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 27px;
        }
        .style2
        {
            width: 92px;
        }
        .style3
        {
            height: 27px;
            width: 92px;
        }
        .style4
        {
            width: 92px;
            height: 38px;
        }
        .style5
        {
            height: 38px;
        }
        .style6
        {
            width: 92px;
            height: 34px;
        }
        .style7
        {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>

<div align="center">
<h1>Manage Time Table</h1>
 <br />
  <br />

</div>
    <div align="center" style="height: 436px">
        <p>
            <asp:Button ID="btnviewtimetable" runat="server" Text="View Time Table" 
                onclick="btnviewtimetable_Click" CausesValidation="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnaddtimetable" runat="server" Text="Add Time Table" 
                onclick="btnaddtimetable_Click" CausesValidation="False" />
        </p>
        <p>
            Select Category
            <asp:DropDownList ID="ddlcategory" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="ddlcategory_SelectedIndexChanged">
            </asp:DropDownList>
      </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Select Category" ForeColor="Red" 
                ControlToValidate="ddlcategory"></asp:RequiredFieldValidator>
      </p>

        <asp:Panel ID="pnladdtimetable" runat="server" Visible="False">

        <table border="5" frame="box" 
        style="color: #000000; font-weight: bold" width="300">
        <tr>
        <td class="style2"></td>
        <td>&nbsp;</td>
        </tr>
        
            <tr>
                <td class="style6">
                    Time</td>
                <td class="style7">
                    <asp:TextBox ID="txttime" runat="server" Width="180px"></asp:TextBox>
                    
                    </asp:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td class="style3">
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Enter Time" ForeColor="Red" ControlToValidate="txttime"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    </td>
                <td align="left" class="style5">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                        onclick="btnsubmit_Click" Font-Bold="True" />
                </td>
            </tr>
        
        </table>

        </asp:Panel>
       
        <asp:Panel ID="pnlviewtimetable" runat="server">
            <asp:GridView ID="gvviewtimetable" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" Height="124px"  Width="400px" 
                DataKeyNames="TimeTableID" onrowcommand="gvviewtimetable_RowCommand" 
                onrowediting="gvviewtimetable_RowEditing">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" />
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

<br /><br /><br />
</asp:Content>
