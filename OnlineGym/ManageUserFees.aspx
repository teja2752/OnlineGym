<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="ManageUserFees.aspx.cs" Inherits="OnlineGym.ManageUserFees" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>
<div align="center">
<br />
<br />
<h1>Manage User Fees</h1>
<br />

    <asp:Panel ID="pnlUserDetails" runat="server">
    
    <asp:GridView ID="gvUserDetails" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" Width="800px" DataKeyNames="UserID" 
            onrowcommand="gvUserDetails_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="FullName" HeaderText="User Name" ReadOnly="True" />
            <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" ReadOnly="True" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" 
                ReadOnly="True" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" ReadOnly="True" />
            <asp:ButtonField ButtonType="Button" CommandName="View" Text="View" />
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

    <asp:Panel ID="pnlManageUserFees" runat="server" Visible="False">
        <Table ID="Table1" runat="server" width="400" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
        <tr>
        <td align="left" style="color: #000000; font-weight: bold" width="150"></td>
        <td align="left"></td>
        </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Customer Name
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCustomerName" runat="server" Enabled="False" 
                        style="margin-bottom: 0px" Width="200px"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtCustomerName">
                    </asp:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Fees</td>
                <td align="left">
                    <asp:TextBox ID="txtFees" runat="server" Width="200px"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" 
                        FilterType="Numbers" TargetControlID="txtFees">
                    </asp:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    &nbsp;</td>
                <td align="left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Enter Fees" ForeColor="Red" ControlToValidate="txtFees"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Year</td>
                <td align="left">
                    <asp:DropDownList ID="ddlYear" runat="server" Width="200px">
                        <asp:ListItem>Select Year</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Month</td>
                <td style="margin-left: 40px" align="left">
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="200px">
                        <asp:ListItem>Select Month</asp:ListItem>
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    &nbsp;</td>
                <td style="margin-left: 40px" align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    MOP</td>
                <td style="margin-left: 40px" align="left">
                    <asp:DropDownList ID="ddlMOP" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlMOP_SelectedIndexChanged" Width="200px">
                        <asp:ListItem>Select MOP</asp:ListItem>
                        <asp:ListItem Value="1">Cash</asp:ListItem>
                        <asp:ListItem Value="2">Self Cheque</asp:ListItem>
                        <asp:ListItem Value="3">Cross Cheque</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </Table>
        <asp:Panel ID="pnlManageBank" runat="server" Visible="False">
        <table width="400" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
        <tr>
        <td align="left" style="color: #000000; font-weight: bold" width="150"></td>
        <td align="left"></td>
        </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Bank Name</td>
                <td align="left">
                    <asp:DropDownList ID="ddlBankName" runat="server" Width="200px">
                        <asp:ListItem>Select Bank</asp:ListItem>
                        <asp:ListItem>Canara Bank</asp:ListItem>
                        <asp:ListItem>Syndicate Bank</asp:ListItem>
                        <asp:ListItem>State Bank Of India</asp:ListItem>
                        <asp:ListItem>Axis Bank</asp:ListItem>
                        <asp:ListItem>IDBI Bank</asp:ListItem>
                        <asp:ListItem>Bank Of Baroda</asp:ListItem>
                        <asp:ListItem>Vijaya Bank</asp:ListItem>
                        <asp:ListItem>Uninon Bank</asp:ListItem>
                        <asp:ListItem>Co-orporation Bank</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Branch Name</td>
                <td align="left">
                    <asp:TextBox ID="txtBranchName" runat="server" Width="200px"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" 
                        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtBranchName">
                    </asp:FilteredTextBoxExtender>
                    </td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="color: #000000; font-weight: bold" width="150">
                    Cheque No</td>
                <td align="left">
                    <asp:TextBox ID="txtChequeNo" runat="server" Width="200px"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" 
                        FilterType="Numbers" TargetControlID="txtChequeNo">
                    </asp:FilteredTextBoxExtender>
                    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
                        FilterType="Numbers" TargetControlID="txtChequeNo">
                    </asp:FilteredTextBoxExtender>
                    </td>
            </tr>
        </table>

        </asp:Panel>
        <br />
        <br />
        <asp:Label ID="lblFeesPaid" runat="server" Text="Fees Paid Succesfully" 
            Font-Bold="True" Font-Size="X-Large" ForeColor="Green" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
            onclick="btnsubmit_Click" Height="26px" Width="100px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnback" runat="server" Text="Back" Width="100px" 
            Height="28px" onclick="btnback_Click1" CausesValidation="False" />
    </asp:Panel>





</div>

</asp:Content>
