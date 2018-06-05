<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EventsPage.aspx.vb" Inherits="SportsManagementSystem.EventsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
    <div style="font-size: xx-large">
    
        Events Home<br />
        <asp:Button ID="EventsButton" runat="server" ForeColor="Black" Height="84px" Text="Manage Events" Width="160px" PostBackUrl="~/EventManagement.aspx" />
        <br />
        <br />
    
        <br />
        <br />
    
    </div>
        <asp:Label ID="Label1" runat="server" Text="Search Event Records"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="EventRecord" runat="server">Enter Event ID</asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <p style="text-align: left">
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#0066FF" NavigateUrl="~/Login.aspx" style="text-align: left">Logout</asp:HyperLink>
        </p>
    </form>
</body>
</html>
