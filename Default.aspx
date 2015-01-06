<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />
     <div class="block" id="photoID">
        <asp:Image ID="photo" runat="server" />
        <br />
        <asp:Image ID="user" runat="server" />
        <asp:Label ID="userName" runat="server" Text="userName"></asp:Label>
        <asp:Label ID="photoName" runat="server" Text="photoName"></asp:Label>
    </div>
</asp:Content>