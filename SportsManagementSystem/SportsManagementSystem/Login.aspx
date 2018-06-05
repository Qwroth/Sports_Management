<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="SportsManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="text-align: left">
    <form id="form1" runat="server" enableviewstate="True" visible="True">
    <div style="text-align: center; font-size: xx-large">
    
        Login Page<br />
    
    </div>
        <p>
            <asp:Label ID="LoginError" runat="server" ForeColor="#FF3300" Text="Invalid Username or Password" Visible="False"></asp:Label>
        </p>
        <p>
            User Name:&nbsp;&nbsp;
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
        </p>
        <p>
            Password:&nbsp;&nbsp;
            <asp:TextBox runat="server" TextMode="Password" ID="Password"></asp:TextBox>
        </p>
        <asp:Button ID="LogInButton" runat="server" Text="Login" />
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
