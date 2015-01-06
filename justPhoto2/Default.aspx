<%@ Page Title="Just Photos" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script type="text/javascript">
        function initSetBG() {
            var imgUrl = ["../img/dpgbg/jpt_bg_c_1.jpg", "../img/dpgbg/jpt_bg_c_6.jpg"]
            var random_pos = Math.round(Math.random() * imgUrl.length - 1);
            $('#ad').css('background', imgUrl[random_pos]);
        }

        $(document).ready(function () {
            initSetBG();
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="ad">
        <p id="slogan">回歸最原始的照片分享！</p>
        <div class="btnBlock">
            <asp:HyperLink ID="jpt_defaultPageSignup"  runat="server" NavigateUrl="~/Signup.aspx" CssClass="btn btnLogin">註冊</asp:HyperLink>
            <asp:HyperLink ID="jpt_defaultPageLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn">登入</asp:HyperLink>
        </div>
    </div>
</asp:Content>

