<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Lab3.Views.Orders"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="dgOrders" runat="server"></asp:GridView>
    </div>
    </form>

    <asp:Label ID="errorLabel" runat="server"></asp:Label>
</body>
</html>
