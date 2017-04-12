<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lab3.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
    <link href="../Resources/master.css" rel="stylesheet" type="text/css" />
</head>

<body class="container">
     <header>
            <ul>
                <li>
                    <a href="Index.aspx">Home</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
                <li>
                    <a href="Orders.aspx">Previous Orders</a>
                </li>
                <li>
                    <a href="Login.aspx">Admin Login</a>
                </li>
            </ul>
        </header>
    <form id="login" runat="server">

        <table>
            <tr>
                <td>
                    User Name
                </td>
                <td>
                    <asp:TextBox ID="loginName" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="submitLogin" runat="server" Text="Submit" OnClick="submitLogin_Click" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="register" runat="server" Text="Register" OnClick="submitRegister_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
