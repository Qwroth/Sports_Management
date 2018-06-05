Imports System.Data.OleDb
Public Class CompetitorsManagement
    Inherits System.Web.UI.Page

    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub AddCompetitorButton_Click(sender As Object, e As EventArgs) Handles AddCompetitorButton.Click

       provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = "|DataDirectory|\OlympicData.accdb"
        connString = provider & dataFile
        myConnection.ConnectionString = connString

        Dim errorFound = False

        myConnection.Open()

        'the query:
        Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM [Competitors] WHERE [Competitor_Email] = '" & Email.Text & "'", myConnection)
        Dim dr As OleDbDataReader = cmd.ExecuteReader
        ' the following variable is hold true if user is found, and false if user is not found
        Dim emailFound As Boolean = False
        ' the following variables will hold the user first and last name if found.
        
        Dim userType = 0

        'if found:
        While dr.Read
            emailFound = True

        End While

        myConnection.Close()

        Dim characterPattern
        ' Create the required vbscript object
        characterPattern = CreateObject("vbscript.regexp")

        characterPattern.Pattern = "\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"

        If Not characterPattern.test(Email.Text) Then
            ErrorEmail.Text = "its working"
            ErrorEmail.Visible = True
            errorFound = True
        Else
            ErrorEmail.Visible = False
        End If


        If emailFound = True Then
            ErrorEmail.Visible = True
            ErrorEmail.Text = "Email already in use"
            errorFound = True
        ElseIf Not characterPattern.test(Email.Text) Then
            ErrorEmail.Text = "Invalid Email"
            ErrorEmail.Visible = True
            errorFound = True
        Else

            ErrorEmail.Visible = False
        End If

        If Name.Text = "" Then
            ErrorName.Visible = True
            errorFound = True
        Else
            ErrorName.Visible = False
        End If

        If Country.Text = "" Then
            errorCountry.Visible = True
            errorFound = True
        Else
            errorCountry.Visible = False
        End If

        FileName.Text = Photo.FileName
        Dim strFileName = Photo.FileName

        If errorFound = False Then
            If Photo.HasFile Then
                Photo.SaveAs(Server.MapPath("Documents/" + strFileName))
            End If

            AddCompetitor.Insert()
            Response.Redirect("CompetitorsManagement.aspx")
        End If


    End Sub

    Protected Sub AddCompetitor_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles AddCompetitor.Selecting

    End Sub

   

    
    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.Click

        Dim numOfRows = GridView2.Rows.Count

        If numOfRows > 0 Then
            AddRegistration.Insert()
            IDError.Visible = False
        Else
            IDError.Visible = True
        End If

    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs)
        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = "|DataDirectory|\OlympicData.accdb"

        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()

        Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM [Competitors] WHERE [Competitor_Email] = '" & sender.Text & "'", myConnection)
        Dim dr As OleDbDataReader = cmd.ExecuteReader

        Dim emailFound As Boolean = False

        'if found:
        While dr.Read
            emailFound = True
        End While

        myConnection.Close()

        If emailFound = True Then
            sender.text = "Already Taken"
        End If
    End Sub

End Class