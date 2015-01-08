<%@ Page Title="Just Photos" Language="VB" MasterPageFile="~/JustPhotoMaster.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function initSetBG() {
            var imgUrl = ['url("../img/dpgbg/jpt_bg_1.jpg")', 'url("../img/dpgbg/jpt_bg_2.jpg")', 'url("../img/dpgbg/jpt_bg_3.jpg")',
                            'url("../img/dpgbg/jpt_bg_4.jpg")', 'url("../img/dpgbg/jpt_bg_5.jpg")', 'url("../img/dpgbg/jpt_bg_6.jpg")',
                            'url("../img/dpgbg/jpt_bg_7.jpg")']
            var maxNum = imgUrl.length - 1;
            var minNum = 0;
            var random_pos = Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
            $('#ad').css('background-image', imgUrl[random_pos]);
        }

        //window.onload = initSetBG;
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="ad">
        <div id="ad_contents">
            <%--<span>回歸最原始的照片分享</span>--%>
            <span id="slogan">回到最原始的照片分享</span>
            <div id="ad_btnpanel">
                <asp:HyperLink ID="jpt_defaultPageSignup"  runat="server" NavigateUrl="~/Signup.aspx" CssClass="btn btnLogin">註冊</asp:HyperLink>
                <br /><br />
                <asp:HyperLink ID="jpt_defaultPageLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn">登入</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

