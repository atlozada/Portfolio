<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Lab3.Views.Menu" MasterPageFile="~/Views/layouts.Master"%>


<asp:Content runat="server" ContentPlaceHolderID="Body">
        <table>
            <tr>
                <th>Item</th>
                <th>Amount</th>
                <th></th>
                <th></th>
            </tr>

            <tr>    
                <td><asp:Label ID="tamalesLabel" runat="server" Text="Tamales" CssClass="labels"></asp:Label></td>
                <td><asp:Label ID="numTamales" runat="server" Text="0"></asp:Label></td>
                <td><asp:Button ID="addTamales" runat="server" Text="Add" OnClick="addItem" /></td>
                <td><asp:Button ID="removeTamales" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>
         
            <tr>
                <td><asp:Label ID="carnitasLabel" runat="server" Text="Carnitas" CssClass="labels"></asp:Label>   </td>
                <td><asp:Label ID="numCarnitas" runat="server" Text="0"></asp:Label>     </td>
                <td><asp:Button ID="addCarnitas" runat="server" Text="Add" OnClick="addItem"/></td>
                <td><asp:Button ID="removeCarnitas" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="frijolesLabel" runat="server" Text="Frijoles Negros con Carne" CssClass="labels"></asp:Label></td>
                <td><asp:Label ID="numFrijoles" runat="server" Text="0"></asp:Label></td>
                <td><asp:Button ID="addFrijoles" runat="server" Text="Add" OnClick="addItem"/></td>
                <td><asp:Button ID="removeFrijoles" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="chileLabel" runat="server" Text="Chile Rellenos" CssClass="labels"></asp:Label> </td>
                <td><asp:Label ID="numChile" runat="server" Text="0"></asp:Label></td>
                <td><asp:Button ID="addChile" runat="server" Text="Add" OnClick="addItem"/></td>
                <td><asp:Button ID="removeChile" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="chilaquilesLabel" runat="server" Text="Chilaquiles" CssClass="labels"></asp:Label></td>
                <td><asp:Label ID="numChilaquiles" runat="server" Text="0"></asp:Label></td>
                <td><asp:Button ID="addChilaquiles" runat="server" Text="Add" OnClick="addItem"/></td>
                <td><asp:Button ID="removeChilaquiles" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="horchataLabel" runat="server" Text="Horchata" CssClass="labels"></asp:Label></td>
                <td><asp:Label ID="numHorchata" runat="server" Text="0"></asp:Label></td>
                <td><asp:Button ID="addHorchata" runat="server" Text="Add" OnClick="addItem" /></td>
                <td><asp:Button ID="removeHorchata" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>

            <tr>
                <td><asp:Label ID="jugoLabel" runat="server" Text="Jugo de Tamarindo" CssClass="labels"></asp:Label></td>
                <td><asp:Label ID="numJugo" runat="server" Text="0"></asp:Label></td>
                <td><asp:Button ID="addJugo" runat="server" Text="Add" OnClick="addItem"/></td>
                <td><asp:Button ID="removeJugo" runat="server" Text="Remove" OnClick="removeItem" /></td>
            </tr>       
        </table>

        <div>
            <asp:Label ID="nameLabel" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="userName" runat="server"></asp:TextBox>
        </div>
       
        <asp:Button ID="checkout" runat="server" Text="Checkout" OnClick="changePage" />
</asp:Content>
