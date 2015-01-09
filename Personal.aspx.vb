
Partial Class Personal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Session("isLoginState") = "OK" Then
            Response.Redirect("~\NotSignin.aspx")
        Else
            Dim link_masterPageSignup As HyperLink = CType(Page.Master.FindControl("jpt_masterPageSignup"), HyperLink)
            Dim link_masterPageLogin As HyperLink = CType(Page.Master.FindControl("jpt_masterPageLogin"), HyperLink)
            Dim link_masterPageAccount As HyperLink = CType(Page.Master.FindControl("jpt_masterPageAccount"), HyperLink)
            Dim link_masterPagePersonal As HyperLink = CType(Page.Master.FindControl("jpt_masterPagePersonal"), HyperLink)
            Dim link_masterPageUpload As HyperLink = CType(Page.Master.FindControl("jpt_masterPageUpload"), HyperLink)
            Dim link_masterPageLogout As Button = CType(Page.Master.FindControl("jpt_masterPageLogout"), Button)

            link_masterPageSignup.Visible = False
            link_masterPageLogin.Visible = False
            link_masterPageAccount.Visible = True
            link_masterPagePersonal.Visible = True
            link_masterPageUpload.Visible = True
            link_masterPageLogout.Visible = True

            link_masterPageAccount.Text = Session("jpt_memberAcc").ToString()
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
                Dim p_account As String = jptDataReader("account").ToString()
                Dim p_email As String = jptDataReader("email").ToString()
                Dim p_name As String = jptDataReader("name").ToString()
                Dim p_description As String = jptDataReader("description").ToString()

                name.Text = p_name
                description.Text = p_description
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

    Private Sub UserData(userID As Integer)
        Dim myConn As System.Data.SqlClient.SqlConnection
        myConn = New Data.SqlClient.SqlConnection
        Dim strConn As String = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()
        myConn.ConnectionString = strConn

        Dim myCommand As System.Data.SqlClient.SqlCommand
        myCommand = New System.Data.SqlClient.SqlCommand
        myCommand.Connection = myConn
        myCommand.CommandType = Data.CommandType.StoredProcedure
        myCommand.CommandText = "GETUSERINFOBYID"
        myCommand.Parameters.Add(New System.Data.SqlClient.SqlParameter("@userID", System.Data.SqlDbType.Int))
        myCommand.Parameters("@userID").Value = 1
        '"SELECT * from dbjpt_Users where dbjpt_Users.ID  = @userID "

        Dim dr As System.Data.SqlClient.SqlDataReader = Nothing

        Try
            myConn.Open()
            dr = myCommand.ExecuteReader

            Dim name As String = dr("name").ToString()
            Dim description As String = dr("description").ToString
            Dim headPictureURL As String = dr("headPicture").ToString

        Catch ex As Exception
            '--Error Handling

        Finally
            If Not (dr Is Nothing) Then
                myCommand.Cancel()
                dr.Close()
            End If

            If (myConn.State = System.Data.ConnectionState.Open) Then
                myConn.Close()
                myConn.Dispose()
            End If
        End Try


    End Sub

    Private Sub BindPhoto()
        Try
            Dim myConn As System.Data.SqlClient.SqlConnection
            myConn = New System.Data.SqlClient.SqlConnection
            Dim strConn As String = ConfigurationManager.ConnectionStrings("JustPhotoDBConnStr").ConnectionString.ToString()
            myConn.ConnectionString = strConn

            Dim myCommand As System.Data.SqlClient.SqlCommand
            myCommand = New System.Data.SqlClient.SqlCommand
            myCommand.Connection = myConn
            myCommand.CommandType = Data.CommandType.Text
            myCommand.CommandText = "select 10 from dbjpt_Photos order date"

            Dim dr As System.Data.SqlClient.SqlDataReader = Nothing

            Try
                myConn.Open()
                dr = myCommand.ExecuteReader

                While (dr.Read())
                    photo.ImageUrl = dr("photo").ToString
                    '--利用user去找userName和headPicture---
                    Dim userID As Integer = dr("user")
                    UserData(userID)
                    '--------------------------------------
                    photoName.Text = dr("name").ToString


                End While
            Catch ex As Exception
                '--Error Handling

            Finally
                If Not (dr Is Nothing) Then
                    myCommand.Cancel()
                    dr.Close()
                End If

                If (myConn.State = System.Data.ConnectionState.Open) Then
                    myConn.Close()
                    myConn.Dispose()
                End If
            End Try
        Catch ex As Exception
            '--Error Handling
        End Try
    End Sub


End Class
