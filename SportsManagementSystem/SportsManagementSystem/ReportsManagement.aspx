<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportsManagement.aspx.vb" Inherits="SportsManagementSystem.ReportsManagement" EnableEventValidation="false" %>

<%@ Register assembly="Aspose.Pdf.GridViewExport" namespace="Aspose.Pdf.GridViewExport" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
    <div style="text-align: center; font-size: xx-large">
    
        Reports Management</div>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#0066FF" NavigateUrl="~/EventsPage.aspx">Back</asp:HyperLink>
        </p>
        <br />
        <asp:TextBox ID="EventRecord" runat="server" Visible="False"></asp:TextBox>
        <br />
        
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Records] WHERE ([Event_ID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="EventRecord" Name="Event_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        
        <br />
        Olympic GamesEvent Summary<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Record ID" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Record ID" HeaderText="Record ID" SortExpression="Record ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" SortExpression="Event_ID" />
                <asp:TemplateField HeaderText="Competitor_ID" SortExpression="Competitor_ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Competitor_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Competitor_ID") %>'></asp:Label>
                        <br />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="hello" DataTextField="Competitor_Country" DataValueField="Competitor_Country" Visible="False">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="hello" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT [Competitor_Country] FROM [Competitors] WHERE ([Competitor_ID] = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label2" Name="Competitor_ID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Competitor_Position" HeaderText="Competitor_Position" SortExpression="Competitor_Position" />
                <asp:TemplateField HeaderText="COmpetitor_Medal" SortExpression="COmpetitor_Medal">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("COmpetitor_Medal") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("COmpetitor_Medal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <p>
            &nbsp;</p>
        
        <p>
        <asp:Label ID="Label3" runat="server" Text="Tally Results"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Export WORD" />
        </p>
        <p>
            Event Number&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </p>
    <p>
        <asp:AccessDataSource ID="AccessDataSource4" runat="server" DataFile="App_Data\OlympicData.accdb" DeleteCommand="DELETE FROM `Events` WHERE `Event_ID` = ?" InsertCommand="INSERT INTO `Events` (`Event_ID`, `Game_ID`, `FeatureEvent`, `EventVenu`, `EventDate`, `EventStartTime`, `EventEndTime`, `EventDescription`, `WorldRecord`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `Event_ID`, `Game_ID`, `FeatureEvent`, `EventVenu`, `EventDate`, `EventStartTime`, `EventEndTime`, `EventDescription`, `WorldRecord` FROM `Events`" UpdateCommand="UPDATE `Events` SET `Game_ID` = ?, `FeatureEvent` = ?, `EventVenu` = ?, `EventDate` = ?, `EventStartTime` = ?, `EventEndTime` = ?, `EventDescription` = ?, `WorldRecord` = ? WHERE `Event_ID` = ?">
            <DeleteParameters>
                <asp:Parameter Name="Event_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Event_ID" Type="Int32" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="String" />
                <asp:Parameter Name="EventVenu" Type="String" />
                <asp:Parameter Name="EventDate" Type="DateTime" />
                <asp:Parameter Name="EventStartTime" Type="DateTime" />
                <asp:Parameter Name="EventEndTime" Type="DateTime" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="String" />
                <asp:Parameter Name="EventVenu" Type="String" />
                <asp:Parameter Name="EventDate" Type="DateTime" />
                <asp:Parameter Name="EventStartTime" Type="DateTime" />
                <asp:Parameter Name="EventEndTime" Type="DateTime" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="Int32" />
                <asp:Parameter Name="Event_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        </p>
        
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Records] WHERE ([Event_ID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="EventRecord" Name="Event_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="AccessDataSource2">
            <ItemTemplate>

                <asp:Image ID="LoadImage" runat="server" ImageUrl =   '<%# "Documents/" + Eval("Event_Photo")%>' />
               
            </ItemTemplate>
            
        </asp:Repeater>

        
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Photos] WHERE ([Event_ID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="EventRecord" Name="Event_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="Event_ID" DataSourceID="AccessDataSource4" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Event_ID" HeaderText="Event_ID" ReadOnly="True" SortExpression="Event_ID" />
                <asp:TemplateField HeaderText="Game_ID" SortExpression="Game_ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Game_ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="hello" runat="server" Text='<%# Bind("Game_ID") %>'></asp:Label>
                        <asp:DropDownList ID="DropList" runat="server" DataSourceID="gameID" DataTextField="Game_Name" DataValueField="Game_Name">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="gameID" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Games] WHERE ([Game_ID] = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hello" Name="Game_ID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FeatureEvent" HeaderText="FeatureEvent" SortExpression="FeatureEvent" />
                <asp:BoundField DataField="EventVenu" HeaderText="EventVenu" SortExpression="EventVenu" />
                <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                <asp:BoundField DataField="EventStartTime" HeaderText="EventStartTime" SortExpression="EventStartTime" />
                <asp:BoundField DataField="EventEndTime" HeaderText="EventEndTime" SortExpression="EventEndTime" />
                <asp:BoundField DataField="EventDescription" HeaderText="EventDescription" SortExpression="EventDescription" />
                <asp:TemplateField HeaderText="WorldRecord" SortExpression="WorldRecord">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("WorldRecord") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="yo" runat="server" Text='<%# Bind("WorldRecord") %>'></asp:Label>
                        <asp:DropDownList ID="hi" runat="server" DataSourceID="bye" DataTextField="Competitor_Name" DataValueField="Competitor_Name">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="bye" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Competitors] WHERE ([Competitor_ID] = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="yo" Name="Competitor_ID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
    </body>
</html>
