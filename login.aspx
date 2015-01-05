<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="tabs">
        <a href="#" id="sign-in" data-state="active">Login</a>
        <a href="#" id="sign-up"data-state="inactive">Sign Up</a>
    </div>
    <div id="loginBlock" class="accountBlock">
        <table>
            <tr>
                <td class="auto-style1">E-mail</td>
                <td class="auto-style1"><asp:TextBox ID="email_l" type="email" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><asp:TextBox ID="pw" type="password" maxlength="30" runat="server" ValidateRequestMode="Inherit"></asp:TextBox></td>
            </tr>
            <td><td colspan="2"></td></td>
            <tr>
                <td colspan="2"><asp:Button ID="login" runat="server" Text="Login" /></td>
            </tr>
        </table>
    </div>
    <div id="signupBlock" class="accountBlock">
        <table>
            <tr>
                <td>E-mail</td>
                <td><asp:TextBox ID="email_s" type="email" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><asp:TextBox ID="userName" type="text" maxlength="30" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><asp:TextBox ID="pw_s" type="password" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="signup" runat="server" Text="Sign Up" /></td>
            </tr>
        </table>
        
        
    </div>
    
</asp:Content>

