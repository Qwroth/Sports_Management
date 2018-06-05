<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminPage.aspx.vb" Inherits="SportsManagementSystem.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="font-size: xx-large">
    
        Admin Home</div>
        <asp:Button ID="CompetitorsButton" runat="server" ForeColor="Black" Height="84px" Text="Manage Competitors" Width="160px" />
        <br />
        <br />
        <asp:Button ID="GamesButton" runat="server" ForeColor="Black" Height="84px" Text="Manage Games" Width="160px" />
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p style="text-align: left">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0066FF" NavigateUrl="~/Login.aspx" style="text-align: left">Logout</asp:HyperLink>
        </p>
    </form>
</body>
</html>
