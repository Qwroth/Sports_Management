
Imports System.Data.OleDb

Public Class GamesManagement
    Inherits System.Web.UI.Page

    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection
    Dim errorFound

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

   

    Protected Sub AddGameButton_Click(sender As Object, e As EventArgs) Handles AddGameButton.Click

        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = "|DataDirectory|\OlympicData.accdb"

        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()


        'the query:
        Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM [Games] WHERE [Game_Code] = '" & Code.Text & "' Or [Game_Name] = '" & Name.Text & "'", myConnection)
        Dim dr As OleDbDataReader = cmd.ExecuteReader
        ' the following variable is hold true if user is found, and false if user is not found
        Dim gameFound As Boolean = False
       
        'if found:
        While dr.Read
            gameFound = True

        End While

        myConnection.Close()

        errorFound = False

        ' Declare the variable
        Dim characterPattern
        ' Create the required vbscript object
        characterPattern = CreateObject("vbscript.regexp")

        characterPattern.Pattern = "([A-Z])([A-Z])([A-Z])([A-Z])(\d)(\d)(\d)"


        'validate blank fields
        If gameFound = True Then
            gameExists.Visible = True
            errorFound = True
        Else
            gameExists.Visible = False
        End If

        If Code.Text = "" Then
            CodeBlank.Visible = True
            CodeBlank.Text = "Game code must not be left blank"
            errorFound = True
        ElseIf Len(Code.Text) <> 7 Then
            CodeBlank.Text = "Game code must be 7 characters in length"
            CodeBlank.Visible = True
            errorFound = True
        ElseIf Not characterPattern.test(Code.Text) Then
            CodeBlank.Text = "Game code must be a format of AAA1111"
            CodeBlank.Visible = True
            errorFound = True
        Else
            CodeBlank.Visible = False
        End If

        If Name.Text = "" Then
            NameBlank.Visible = True
            errorFound = True
        Else
            NameBlank.Visible = False
        End If

        If RuleBookUpload.HasFile = False Then
            fileBlank.Visible = True
            errorFound = True
        Else
            fileBlank.Visible = False
        End If


        RuleBookletName.Text = RuleBookUpload.FileName
        Dim strFileName = RuleBookUpload.FileName


        'if there are no errors add new game to the database
        If errorFound = False Then
            AddGame.Insert()
            RuleBookUpload.SaveAs(Server.MapPath("Documents/" + strFileName))
            Response.Redirect("GamesManagement.aspx")

        End If


       

    End Sub


    Protected Sub TextBox3_TextChanged(sender As Object, e As EventArgs)
        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = "|DataDirectory|\OlympicData.accdb"

        connString = provider & dataFile
        myConnection.ConnectionString = connString
        myConnection.Open()

        Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM [Games] WHERE [Game_Code] = '" & sender.Text & "'", myConnection)
        Dim dr As OleDbDataReader = cmd.ExecuteReader

        Dim gameFound As Boolean = False

        'if found:
        While dr.Read
            gameFound = True
        End While

        myConnection.Close()

        If gameFound = True Then
            sender.text = ""
        End If
    End Sub
End Class