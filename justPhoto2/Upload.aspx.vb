Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Partial Class Upload

    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        '-- If Not Session("isLoginState") = "OK" Then
        '--Response.Redirect("~\NotSignin.aspx")
        '-- Else
        '--  Dim link_masterPageSignup As HyperLink = CType(Page.Master.FindControl("jpt_masterPageSignup"), HyperLink)
        '-- Dim link_masterPageLogin As HyperLink = CType(Page.Master.FindControl("jpt_masterPageLogin"), HyperLink)
        '-- Dim link_masterPageAccount As HyperLink = CType(Page.Master.FindControl("jpt_masterPageAccount"), HyperLink)
        '-- Dim link_masterPageUpload As HyperLink = CType(Page.Master.FindControl("jpt_masterPageUpload"), HyperLink)
        '-- Dim link_masterPageLogout As HyperLink = CType(Page.Master.FindControl("jpt_masterPageLogout"), HyperLink)

        '--link_masterPageSignup.Visible = False
        '--  link_masterPageLogin.Visible = False
        '--link_masterPageAccount.Visible = True
        '--link_masterPageUpload.Visible = True
        '-- link_masterPageLogout.Visible = True
        '--End If
    End Sub
    Protected Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error

    End Sub


    Protected Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles picuploadsubmit.Click

        Dim savepath As String = Server.MapPath("~\img\urspics\") '--Storage path
        Dim filename As String = picuploadbox.FileName '--User upload file's name
        Dim picname As String = filename '--Update User upload file's name
        Dim filesize As Integer = picuploadbox.PostedFile.ContentLength '---User upload file's size
        Dim extension As String = System.IO.Path.GetExtension(filename).ToLower() '---Dim upload file's extension
        Dim allowedExtensions As String() = {".jpg", ".jpeg", ".png"} '-- Dim User just can use these extension
        Dim fileOK As Boolean = False '-- Use to judge  User upload file's extension

        If (picuploadbox.HasFile) Then

            Try '--extension is .jpg .jpeg .png' and file's size < 10MB
                For i = 0 To (allowedExtensions.Length - 1)
                    If extension = allowedExtensions(i) And (filesize < 1100000) Then
                        fileOK = True   '-- User upload file's extension is .jpg .jpeg .png
                        savepath = savepath & filename
                        picuploadbox.SaveAs(savepath)
                        status.Text = "上傳成功" & filename
                        status1.Text = ""
                    End If
                Next
                '--Dim i As Integer = JustPhotoDB_Photos(filename)
                '--If (i > 0) Then
                '--status.Text = " 上傳成功" & filename
                '--End If
            Catch ex As Exception
            End Try
            status.Text = " 檔案大小應為:10MB以內，<br/>檔案副檔名應為：jpg、jpeg、png" & status1.Text = ""
        Else
            status.Text = ""
            status1.Text = "<h3>請先選擇檔案，再行上傳<h3/>"
        End If
      

    End Sub
    Function JustPhotoDB_Photos(InputFilename As String) As Integer

        Dim conn_Photos As SqlConnection = New SqlConnection(WebConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString)
        Dim cmd_Photos As SqlCommand = New SqlCommand("Insert Into JustPhotoDB_Photos(JustPhotoDB_Photos_ID,JustPhotoDB_Photos_name,JustPhotoDB_Photos_date,JustPhotoDB_Photos_user) Values(getdate(),'" & InputFilename & "','fgfdg')", conn_Photos)
        Dim i As Integer = 0
        Try
            conn_Photos.Open()
            i = cmd_Photos.ExecuteNonQuery()
        Catch ex As Exception
            '-- If Not Session("isLoginState") = "OK" Then
            '--Response.Redirect("~\Upload.aspx")
            '--End If

        Finally
            cmd_Photos.Cancel()
            If (conn_Photos.State = ConnectionState.Open) Then
                conn_Photos.Close()
                conn_Photos.Dispose()
            End If
        End Try
        Return i
    End Function



End Class
