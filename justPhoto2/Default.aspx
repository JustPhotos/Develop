<%@ Page Title="" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="ad">
        <p id="slogan">回歸最原始的照片分享！</p>
        <div class="btnBlock">
            <asp:HyperLink ID="jpt_defaultPageSignup"  runat="server" NavigateUrl="~/Signup.aspx" CssClass="btn">註冊</asp:HyperLink>
            <asp:HyperLink ID="jpt_defaultPageLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn">登入</asp:HyperLink>
        </div>
    </div>
</asp:Content>

