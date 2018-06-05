
Imports System.Data.OleDb
Public Class Login
    Inherits System.Web.UI.Page


    Dim provider As String
    Dim dataFile As String
    Dim connString As String
    Dim myConnection As OleDbConnection = New OleDbConnection



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LogInButton_Click(sender As Object, e As EventArgs) Handles LogInButton.Click


        provider = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source ="
        dataFile = "|DataDirectory|\OlympicData.accdb"
        connString = provider & dataFile
        myConnection.ConnectionString = connString

        myConnection.Open()


        'the query:
        Dim cmd As OleDbCommand = New OleDbCommand("SELECT * FROM [Login] WHERE [UserEmail] = '" & UserName.Text & "' AND [UserPassword] = '" & Password.Text & "'", myConnection)
        Dim dr As OleDbDataReader = cmd.ExecuteReader
        ' the following variable is hold true if user is found, and false if user is not found
        Dim userFound As Boolean = False
        ' the following variables will hold the user first and last name if found.
        Dim FirstName As String = ""
        Dim LastName As String = ""
        Dim userType = 0

        'if found:
        While dr.Read
            userFound = True
            userType = dr("UserType")
        End While


        If userFound = True Then If userType = 1 Then Response.Redirect("AdminPage.aspx") Else Response.Redirect("EventsPage.aspx")

        If userFound <> True Then LoginError.Visible = True


        myConnection.Close()

    End Sub


End Class