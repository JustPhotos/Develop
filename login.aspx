<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="loginBlock">
        <table>
            <tr><th colspan="2">Login</th></tr>
            <tr>
                <td class="auto-style1">信箱&nbsp;&nbsp;</td>
                <td class="auto-style1"><asp:TextBox ID="email_l" type="email" placeholder="信箱" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>密碼&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="pw" type="password" maxlength="30" placeholder="密碼" runat="server" ValidateRequestMode="Inherit"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="login" runat="server" Text="登入" /></td>
            </tr>
        </table>
    </div>
</asp:Content>

