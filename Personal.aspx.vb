
Partial Class Personal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Session("isLoginState") = "OK" Then
            Response.Redirect("~\NotSignin.aspx")
        Else
            Dim link_masterPageHeadPic As ImageButton = CType(Page.Master.FindControl("headPicture"), ImageButton)
            Dim link_masterPageSignup As Button = CType(Page.Master.FindControl("jpt_masterPageSignup"), Button)
            Dim link_masterPageLogin As Button = CType(Page.Master.FindControl("jpt_masterPageLogin"), Button)
            Dim link_masterPageAccount As Button = CType(Page.Master.FindControl("jpt_masterPageAccount"), Button)
            Dim link_masterPagePersonal As Button = CType(Page.Master.FindControl("jpt_masterPagePersonal"), Button)
            Dim link_masterPageUpload As Button = CType(Page.Master.FindControl("jpt_masterPageUpload"), Button)
            Dim link_masterPageLogout As Button = CType(Page.Master.FindControl("jpt_masterPageLogout"), Button)

            link_masterPageHeadPic.Visible = True
            link_masterPageSignup.Visible = False
            link_masterPageLogin.Visible = False
            link_masterPageAccount.Visible = True
            link_masterPagePersonal.Visible = True
            link_masterPageUpload.Visible = True
            link_masterPageLogout.Visible = True

            link_masterPageAccount.Text = Session("jpt_memberAcc").ToString()
            If Not Session("jpt_memberHeadPic") = "" Then
                link_masterPageHeadPic.ImageUrl = "~/img/hdp/" + Session("jpt_id") + "/" + Session("jpt_memberHeadPic")
            Else
                link_masterPageHeadPic.ImageUrl = "~/img/guset_448_448.png"
            End If
        End If

        '-------灰白橫幅上的
        Dim jptConn As System.Data.SqlClient.SqlConnection = New Data.SqlClient.SqlConnection
        jptConn.ConnectionString = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()

        Dim userID As Integer = Integer.Parse(Session("jpt_id"))
        Dim jptCommand As System.Data.SqlClient.SqlCommand
        jptCommand = New System.Data.SqlClient.SqlCommand
        jptCommand.Connection = jptConn
        jptCommand.CommandType = Data.CommandType.StoredProcedure
        jptCommand.CommandText = "GETUSERINFOBYID"

        jptCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.Int))
        jptCommand.Parameters("@ID").Value = userID

        Dim jptDataReader As System.Data.SqlClient.SqlDataReader = Nothing

        Try
            jptConn.Open()
            jptDataReader = jptCommand.ExecuteReader

            While jptDataReader.Read()
                Dim ud_account As String = jptDataReader("account").ToString()
                Dim ud_email As String = jptDataReader("email").ToString()
                Dim ud_name As String = jptDataReader("name").ToString()
                Dim ud_description As String = jptDataReader("description").ToString

                name.Text = ud_name
                description.Text = ud_description
            End While
        Catch ex As Exception

        Finally
            If Not (jptDataReader Is Nothing) Then
                jptCommand.Cancel()
                jptDataReader.Close()
            End If

            If (jptConn.State = System.Data.ConnectionState.Open) Then
                jptConn.Close()
                jptConn.Dispose()
            End If
        End Try

        If Not Page.IsPostBack Then
            BindPhoto()
        End If

    End Sub

    Private Sub BindPhoto()
        Dim jptConn As System.Data.SqlClient.SqlConnection = New Data.SqlClient.SqlConnection
        jptConn.ConnectionString = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()

        Dim jptCommand As System.Data.SqlClient.SqlCommand
        jptCommand = New System.Data.SqlClient.SqlCommand
        jptCommand.Connection = jptConn
        jptCommand.CommandType = Data.CommandType.StoredProcedure
        jptCommand.CommandText = "GETPHOTOBYUSERID"

        jptCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@ID", System.Data.SqlDbType.Int))
        jptCommand.Parameters("@ID").Value = Integer.Parse(Session("jpt_id"))

        Dim jptDataReader As System.Data.SqlClient.SqlDataReader = Nothing

        Try
            jptConn.Open()
            jptDataReader = jptCommand.ExecuteReader
            photoList.DataSource = jptDataReader
            photoList.DataBind()

            While jptDataReader.Read()

                Dim bp_photoID As String = jptDataReader("photoID").ToString()
                Dim bp_photoName As String = jptDataReader("photoName").ToString()
                Dim bp_userName As String = jptDataReader("userName").ToString()
                Dim bp_userHeadPicture As String = jptDataReader("userHeadPicture").ToString

                photo.ImageUrl = "\img\urspics\" + Session("jpt_id").ToString + "_" + Session("jpt_memberAcc").ToString '--DATE!!
                user.ImageUrl = bp_userHeadPicture.ToString()
                userName.Text = bp_userName.ToString()
                photoName.Text = bp_photoName.ToString()
            End While
        Catch ex As Exception

        Finally
            If Not (jptDataReader Is Nothing) Then
                jptCommand.Cancel()
                jptDataReader.Close()
            End If

            If (jptConn.State = System.Data.ConnectionState.Open) Then
                jptConn.Close()
                jptConn.Dispose()
            End If
        End Try
    End Sub



End Class
