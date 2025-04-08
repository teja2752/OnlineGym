<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="ManageDailyWorkout.aspx.cs" Inherits="OnlineGym.ManageDailyWorkout" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
    </style>

    <%--<script type="text/javascript">
        function Validate(sender, args) {
            if (document.getel("<%=cblSubCat.ClientID %>").checked = true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    
    </script>--%>




</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="test" runat="server"></asp:ToolkitScriptManager>

<div align="center">
<h1>Manage Daily Workout</h1>
<br />
<br />

    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" Width="800px" DataKeyNames="UserID" 
        onrowcommand="gvUsers_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="FullName" HeaderText="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
            <asp:BoundField DataField="EmailID" HeaderText="Email" />
            <asp:ButtonField CommandName="View" Text="View" ButtonType="Button" />
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

    <table id="tblDailyWorkout" runat="server" width="400px"  border="5" frame="box" 
        style="color: #000000; font-weight: bold">
<tr>
<td align="left">&nbsp;</td>
<td>&nbsp;</td>
</tr>

<tr>
<td align="left">Select Date</td>
<td><asp:TextBox ID="txtWODate" runat="server" Width="180px"></asp:TextBox>
    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtWODate" Format="dd/MMM/yyyy">
    </asp:CalendarExtender></td>
</tr>

<tr>
<td align="left"></td>
<td></td>
</tr>

<%--<tr>
<td align="left">Select Trainer</td>
<td>
    <asp:DropDownList ID="ddlTrainer" runat="server" AutoPostBack="True" 
        AppendDataBoundItems="True" Width="180px">
        <asp:ListItem Value="0">Select Trainer</asp:ListItem>
    </asp:DropDownList>
    </td>
</tr>--%>
<%--<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="Select Trainer" ForeColor="Red" 
        ControlToValidate="ddlTrainer"></asp:RequiredFieldValidator>
    </td>
</tr>--%>


<tr>
<td align="left">Select Time</td>
<td>
    <asp:DropDownList ID="ddlTime" runat="server" AutoPostBack="True" 
        AppendDataBoundItems="True" Width="180px">
        <asp:ListItem Value="0">Select Time</asp:ListItem>
    </asp:DropDownList>
    </td>
</tr>



<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="Select Time " ForeColor="Red" ControlToValidate="ddlTime"></asp:RequiredFieldValidator>
    </td>
</tr>



<tr>
<td align="left">Select Category</td>
<td>
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ddlCategory_SelectedIndexChanged" 
        AppendDataBoundItems="True" Width="180px">
        <asp:ListItem Value="0">Select Category</asp:ListItem>
    </asp:DropDownList>
    </td>
</tr>



<tr>
<td align="left">&nbsp;</td>
<td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="Select Category" ForeColor="Red" 
        ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
    </td>
</tr>



<tr>
<td align="left">Select Subcategory</td>
<td>
    <asp:CheckBoxList ID="cblSubCat" runat="server" Width="180px" 
        onselectedindexchanged="cblSubCat_SelectedIndexChanged">
    </asp:CheckBoxList>
    </td>
</tr>



<tr>
<td class="style1" align="left"></td>
<td class="style1">
    <%--<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select subcategory" ClientValidationFunction="Validate"></asp:CustomValidator>--%>
    </td>
</tr>



<tr>
<td class="style1" align="left">Description</td>
<td class="style1">
    <asp:TextBox ID="txtDescription" runat="server" Height="50px" Width="180px" 
        TextMode="MultiLine"></asp:TextBox>
    <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
        FilterType="UppercaseLetters,LowercaseLetters" TargetControlID="txtDescription">
    </asp:FilteredTextBoxExtender>
    </td>
</tr>



<tr>
<td class="style1" align="left">&nbsp;</td>
<td class="style1">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ErrorMessage="Enter Description" ForeColor="Red" 
        ControlToValidate="txtDescription"></asp:RequiredFieldValidator>
    </td>
</tr>



<tr>
<td class="style1" align="center">
    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
        Text="Submit" Width="100px" Font-Bold="True" />
    </td>
<td class="style1">
    <asp:Button ID="btnReset" runat="server" Text="Cancel" Width="100px" 
        CausesValidation="False" Font-Bold="True" onclick="btnReset_Click" />
    </td>
</tr>



</table>

<br />
<br />

</div>

</asp:Content>
