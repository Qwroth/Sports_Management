Imports System.Data.OleDb
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html.simpleparser
Imports iTextSharp.text.html
Imports System.Web.UI.HtmlControls
Imports System.IO
Imports iTextSharp.text



Public Class ReportsManagement
    Inherits System.Web.UI.Page

    Dim Gold = 0
    Dim SIlver = 0
    Dim Bronze = 0
    Dim countries
    Dim i = 0
    Dim rows As Integer
    Dim countryList(1, rows + 50)
    Dim country
    Dim entryCOunt
    Dim result = ""
    Dim text = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim context As HttpContext = HttpContext.Current

        EventRecord.Text = context.Items("EventSearch")

        Label4.Text = EventRecord.Text

        tallyResluts()


        

    End Sub


    Public Sub tallyResluts()

        Dim totalMedals
        Dim text = ""
        totalMedals = GridView1.Rows.Count

        Dim duplicate, tally(5, 50), entryCount
        entryCount = 0

        'insert from entries into tally array for scoring
        For p = 0 To rows
            duplicate = 0
            For a = 0 To p
                If tally(0, a) = countryList(0, p) Then
                    duplicate = 1
                End If
            Next

            If duplicate = 0 Then
                tally(0, entryCount) = countryList(0, p)
                tally(1, entryCount) = 0
                tally(2, entryCount) = 0
                tally(3, entryCount) = 0
                tally(4, entryCount) = 0

            Else
                entryCount = entryCount - 1
            End If

            entryCount = entryCount + 1

        Next

        For x = 0 To rows
            For n = 0 To entryCount
                If countryList(0, x) = tally(0, n) Then
                    tally(1, n) = tally(1, n) + 1
                    If countryList(1, x) = "Gold" Then
                        tally(2, n) = tally(2, n) + 1
                    ElseIf countryList(1, x) = "Silver" Then
                        tally(3, n) = tally(3, n) + 1
                    ElseIf countryList(1, x) = "Bronze" Then
                        tally(4, n) = tally(4, n) + 1
                    End If

                End If
            Next
        Next


        Dim tempCountry, tempMedals, tempGolds, tempSilver, tempBronze, place
        place = entryCount

        For m = 0 To entryCount
            For j = i To entryCount
                If tally(1, m) > tally(1, j) Then
                    tempCountry = tally(0, m)
                    tempMedals = tally(1, m)
                    tempGolds = tally(2, m)
                    tempSilver = tally(3, m)
                    tempBronze = tally(4, m)

                    tally(0, m) = tally(0, j)
                    tally(1, m) = tally(1, j)
                    tally(2, m) = tally(2, j)
                    tally(3, m) = tally(3, j)
                    tally(4, m) = tally(4, j)

                    tally(0, j) = tempCountry
                    tally(1, j) = tempMedals
                    tally(2, j) = tempGolds
                    tally(3, j) = tempSilver
                    tally(4, j) = tempBronze
                End If


                'if two entries have the same total medal count, check golds
                If tally(1, m) = tally(1, j) Then
                    If tally(2, m) > tally(2, j) Then
                        tempCountry = tally(0, m)
                        tempMedals = tally(1, m)
                        tempGolds = tally(2, m)
                        tempSilver = tally(3, m)
                        tempBronze = tally(4, m)

                        tally(0, m) = tally(0, j)
                        tally(1, m) = tally(1, j)
                        tally(2, m) = tally(2, j)
                        tally(3, m) = tally(3, j)
                        tally(4, m) = tally(4, j)

                        tally(0, j) = tempCountry
                        tally(1, j) = tempMedals
                        tally(2, j) = tempGolds
                        tally(3, j) = tempSilver
                        tally(4, j) = tempBronze
                    End If

                    'if two entries have the same gold medal count, check silvers
                    If tally(2, m) = tally(2, j) And tally(3, m) > tally(3, j) Then
                        tempCountry = tally(0, m)
                        tempMedals = tally(1, m)
                        tempGolds = tally(2, m)
                        tempSilver = tally(3, m)
                        tempBronze = tally(4, m)

                        tally(0, m) = tally(0, j)
                        tally(1, m) = tally(1, j)
                        tally(2, m) = tally(2, j)
                        tally(3, m) = tally(3, j)
                        tally(4, m) = tally(4, j)

                        tally(0, j) = tempCountry
                        tally(1, j) = tempMedals
                        tally(2, j) = tempGolds
                        tally(3, j) = tempSilver
                        tally(4, j) = tempBronze
                    End If

                    'if two entries have the same silver medal count, check bronze
                    If tally(3, m) = tally(3, j) And tally(2, m) = tally(2, j) And tally(4, m) > tally(4, j) Then
                        tempCountry = tally(0, m)
                        tempMedals = tally(1, m)
                        tempGolds = tally(2, m)
                        tempSilver = tally(3, m)
                        tempBronze = tally(4, m)

                        tally(0, m) = tally(0, j)
                        tally(1, m) = tally(1, j)
                        tally(2, m) = tally(2, j)
                        tally(3, m) = tally(3, j)
                        tally(4, m) = tally(4, j)

                        tally(0, j) = tempCountry
                        tally(1, j) = tempMedals
                        tally(2, j) = tempGolds
                        tally(3, j) = tempSilver
                        tally(4, j) = tempBronze
                    End If


                    'if two entries have the same bronze medal count, sort aplhabetically
                    If tally(4, m) = tally(4, j) And tally(3, m) = tally(3, j) And tally(2, m) = tally(2, j) And tally(1, m) = tally(1, j) And tally(0, m) > tally(0, j) Then
                        tempCountry = tally(0, m)
                        tempMedals = tally(1, m)
                        tempGolds = tally(2, m)
                        tempSilver = tally(3, m)
                        tempBronze = tally(4, m)

                        tally(0, m) = tally(0, j)
                        tally(1, m) = tally(1, j)
                        tally(2, m) = tally(2, j)
                        tally(3, m) = tally(3, j)
                        tally(4, m) = tally(4, j)

                        tally(0, j) = tempCountry
                        tally(1, j) = tempMedals
                        tally(2, j) = tempGolds
                        tally(3, j) = tempSilver
                        tally(4, j) = tempBronze
                    End If

                End If
            Next

            'give entry a placement score
            tally(5, m) = place
            place = place - 1

        Next

        'if two or more entries have the same score, give them the same place on the ladder
        Dim f = entryCount - 1
        For h = 0 To f
            If tally(1, f) = tally(1, f + 1) And tally(2, f) = tally(2, f + 1) And tally(3, f) = tally(3, f + 1) And tally(4, f) = tally(4, f + 1) Then
                tally(5, f) = tally(5, f + 1)
            Else
                tally(5, f) = tally(5, f + 1) + 1
            End If
            f = f - 1
        Next

        Dim q
        q = 0


        For k = 0 To entryCount - 1
            result = result & " In Place " & k + 1 & " " & tally(0, q) & " " & tally(1, q) & " Total medals " & tally(2, q) & " Gold medals " & " " & tally(3, q) & " Silver medals " & tally(4, q) & " Bronze medals <br />" & "<br />"
            q = q + 1
        Next

        Label3.Text = result

    End Sub

    Protected Sub GridView4_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView4.RowDataBound
        Dim row As GridViewRow = e.Row



        If row.RowType = DataControlRowType.DataRow Then

            Dim sport As String = CType(row.FindControl("DropList"), DropDownList).SelectedValue
            Dim name As String = CType(row.FindControl("hi"), DropDownList).SelectedValue
            text = text + name + "   For Sport   " + sport & "<br />"
            
        End If

        Label5.Text = text
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim row As GridViewRow = e.Row

        If row.RowType = DataControlRowType.DataRow Then

            Dim medal As String = CType(row.FindControl("Label1"), Label).Text
            Dim country As String = CType(row.FindControl("DropDownList1"), DropDownList).SelectedValue

            If medal = "Gold" Then
                Gold = Gold + 1
            ElseIf medal = "Silver" Then
                SIlver = SIlver + 1
            ElseIf medal = "Bronze" Then
                Bronze = Bronze + 1
            End If

            countries = countries + country & "<br/>"

            countryList(0, i) = country
            countryList(1, i) = medal

            i = i + 1


        End If

        rows = GridView1.Rows.Count
        entryCOunt = i

    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)

    End Sub
   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        


        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition",
        "attachment;filename=GridViewExport.doc")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-word "
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)
        GridView1.AllowPaging = False

        GridView1.RenderControl(hw)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub

   

   

    Protected Sub Repeater1_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand

    End Sub

    Private Sub GridView1_Unload(sender As Object, e As EventArgs) Handles GridView1.Unload

    End Sub

    Protected Sub EventRecord_TextChanged(sender As Object, e As EventArgs) Handles EventRecord.TextChanged

    End Sub

    Protected Sub AccessDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles AccessDataSource1.Selecting

    End Sub
End Class