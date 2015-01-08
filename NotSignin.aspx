<%@ Page Title="Just Photos - 未登入" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="NotSignin.aspx.vb" Inherits="NotSignin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="not_sign_in">
        <div id="ad_contents">
            <div id="slogan">您未登入，請登入...</div>
            <div id="ad_btnpanel">
                <asp:HyperLink ID="jpt_notSigninPageLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn btnNotLogin">登入</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

