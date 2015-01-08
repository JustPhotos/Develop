
Partial Class Personal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Session("isLoginState") = "OK" Then
            Response.Redirect("~\NotSignin.aspx")
        Else
            Dim link_masterPageSignup As HyperLink = CType(Page.Master.FindControl("jpt_masterPageSignup"), HyperLink)
            Dim link_masterPageLogin As HyperLink = CType(Page.Master.FindControl("jpt_masterPageLogin"), HyperLink)
            Dim link_masterPageAccount As HyperLink = CType(Page.Master.FindControl("jpt_masterPageAccount"), HyperLink)
            Dim link_masterPageUpload As HyperLink = CType(Page.Master.FindControl("jpt_masterPageUpload"), HyperLink)
            Dim link_masterPageLogout As HyperLink = CType(Page.Master.FindControl("jpt_masterPageLogout"), HyperLink)

            link_masterPageSignup.Visible = False
            link_masterPageLogin.Visible = False
            link_masterPageAccount.Visible = True
            link_masterPageUpload.Visible = True
            link_masterPageLogout.Visible = True
        End If
    End Sub
End Class
