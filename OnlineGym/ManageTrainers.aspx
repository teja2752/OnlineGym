<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="ManageTrainers.aspx.cs" Inherits="OnlineGym.ManageTrainers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>
<br />
<div align="center">
<h1>Manage Trainers</h1>
<br />
<br />




    <asp:Button ID="btnviewtrainers" runat="server" Text="View Trainers" 
        onclick="btnviewtrainers_Click" CausesValidation="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnaddtrainers" runat="server" Text="Add Trainers" 
        onclick="btnaddtrainers_Click" CausesValidation="False" />
    <br />
    <br />
    <asp:Panel ID="pnladdtrainers" runat="server" Visible="False">
    <table width="400px"  border="5" frame="box" 
        style="color: #000000; font-weight: bold">
    <tr>
    <td align="left" width="150"></td>
    <td align="left"></td>
    </tr>
    
        <tr>
            <td align="left" width="150">
                Trainer Name</td>
            <td align="left">
                <asp:TextBox ID="txttrainername" runat="server" Width="200px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                    FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txttrainername">
                </asp:FilteredTextBoxExtender>
                
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Enter Trainer Name" ForeColor="Red" 
                    ControlToValidate="txttrainername"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                Contact No</td>
            <td align="left">
                <asp:TextBox ID="txtcontactno" runat="server" Width="200px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
                    FilterType="Numbers" TargetControlID="txtcontactno">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Enter Contact No" ForeColor="Red" 
                    ControlToValidate="txtcontactno"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                Email ID</td>
            <td align="left">
                <asp:TextBox ID="txtemailid" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Enter Email " ForeColor="Red" ControlToValidate="txtemailid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                Password</td>
            <td align="left">
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="Enter password" ForeColor="Red" 
                    ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                City</td>
            <td align="left">
                <asp:TextBox ID="txtcity" runat="server" Width="200px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
                    FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtcity">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ErrorMessage="Enter City" ForeColor="Red" ControlToValidate="txtcity"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                Address</td>
            <td align="left">
                <asp:TextBox ID="txtaddress" runat="server" Width="200px"></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" 
                    FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtaddress">
                </asp:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="Enter Address" ForeColor="Red" 
                    ControlToValidate="txtaddress"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                Category ID</td>
            <td align="left">
                <asp:DropDownList ID="ddlcategoryid" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ErrorMessage="Select Category ID" ForeColor="Red" 
                    ControlToValidate="ddlcategoryid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                TimeTable ID</td>
            <td align="left">
                <asp:DropDownList ID="ddltimetableid" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="left" width="150">
                &nbsp;</td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="Select Time Table ID" ForeColor="Red" 
                    ControlToValidate="ddltimetableid"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td width="150">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="100px" 
                    onclick="btnsubmit_Click" Font-Bold="True" />
            </td>
            <td>
                <asp:Button ID="btnreset" runat="server" Text="Reset" Width="100px" 
                    onclick="btnreset_Click" CausesValidation="False" Font-Bold="True" />
            </td>
        </tr>
    
    </table>
    </asp:Panel>
    <asp:Panel ID="pnlviewtrainers" runat="server">
    <br />
        <asp:GridView ID="gvtrainerdetails" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" Width="650px" 
            DataKeyNames="TrainerID" onrowcommand="gvviewtrainers_RowCommand" 
            onrowediting="gvviewtrainers_RowEditing">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TrainerName" HeaderText="Trainer Name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact No" ReadOnly="True" />
                <asp:BoundField DataField="Email" HeaderText="Email ID" ReadOnly="True" />
                <asp:BoundField DataField="City" HeaderText="City" ReadOnly="True" />
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
    <br /><br />

</div>


</asp:Content>
