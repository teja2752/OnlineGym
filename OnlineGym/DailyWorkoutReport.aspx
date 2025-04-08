<%@ Page Title="" Language="C#" MasterPageFile="~/OnlineGymMaster.Master" AutoEventWireup="true" CodeBehind="DailyWorkoutReport.aspx.cs" Inherits="OnlineGym.DailyWorkoutReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
<br />
<br />
<h1>Daily Workout Report
</h1>
<br />
<br />
<br />
    <asp:Panel ID="pnlUserDetails" runat="server">
        <asp:GridView ID="gvUserDetails" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="UserID" ForeColor="#333333" 
            Width="800px" onrowcommand="gvUserDetails_RowCommand">
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

    <asp:Panel ID="pnlDailyWorkout" runat="server" Visible="False">

     <table width="700" border="5" frame="box" 
        style="color: #000000; font-weight: bold">
        <tr>
            <td><asp:Label ID="lblusername" runat="server" Text="User Name"></asp:Label></td>
            <td><asp:TextBox ID="txtusername" runat="server" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td>
                <asp:Label ID="lblmobileno0" runat="server" Text="Mobile No"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtmobileno" runat="server" ReadOnly="True" Width="150px"></asp:TextBox>
            </td>
        </tr>    
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>    
        <tr>
            <td><asp:Label ID="lblemailid" runat="server" Text="Email ID"></asp:Label></td>
            <td><asp:TextBox ID="txtemailid" runat="server" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td>
                <asp:Label ID="lbladdress0" runat="server" Text="Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtaddress" runat="server" ReadOnly="True" Width="150px"></asp:TextBox>
            </td>
        </tr>    
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>    
    </table>
        
        <br />
        <br />
        <asp:GridView ID="gvDailyWorkout" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="DailyWorkoutID,CategoryID" 
            ForeColor="#333333" Width="800px" onrowcommand="gvDailyWorkout_RowCommand" 
            onrowediting="gvDailyWorkout_RowEditing">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" 
                    ReadOnly="True" />
                <asp:BoundField DataField="TrainerName" HeaderText="Trainer" ReadOnly="True" />
                <asp:BoundField DataField="Description" HeaderText="Description" 
                    ReadOnly="True" />
                <asp:BoundField DataField="Time" HeaderText="Time Table" 
                    ReadOnly="True" />
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

        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="lblnorecords" runat="server" Font-Size="XX-Large" 
            ForeColor="#FF3300" Text="No Records Found" Visible="False"></asp:Label>
            
    <asp:Panel ID="pnlCategoryDetails" runat="server">
        <asp:CheckBoxList ID="cblSubCat" runat="server" Enabled="False" 
            RepeatDirection="Horizontal" Width="800px">
        </asp:CheckBoxList>
    </asp:Panel>

        <br />
        <br />
        <asp:Button ID="btncancel" runat="server" CausesValidation="False" 
            onclick="btncancel_Click" Text="Cancel" Width="100px" Font-Bold="True" />

    </asp:Panel>

    <br />


</div>
</asp:Content>
