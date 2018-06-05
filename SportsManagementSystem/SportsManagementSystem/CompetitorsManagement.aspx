<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CompetitorsManagement.aspx.vb" Inherits="SportsManagementSystem.CompetitorsManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center; font-size: xx-large">
    
        Competitor Management</div>
        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#0066FF" NavigateUrl="~/AdminPage.aspx">Back</asp:HyperLink>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="CompetitorData" Width="1302px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="ID" InsertVisible="False" SortExpression="Competitor_ID" />
                <asp:BoundField DataField="Competitor_Salutation" HeaderText="Salutation" SortExpression="Competitor_Salutation" />
                <asp:TemplateField HeaderText="Name" SortExpression="Competitor_Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Competitor_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Competitor_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DoB" SortExpression="Competitor_DoB">
                    <EditItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("Competitor_DoB") %>'></asp:Calendar>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Competitor_DoB") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Competitor_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" Text='<%# Bind("Competitor_Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Already Taken/Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Competitor_Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Competitor_Description" HeaderText="Description" SortExpression="Competitor_Description" />
                <asp:TemplateField HeaderText="Country" SortExpression="Competitor_Country">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Competitor_Country") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Competitor_Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender" SortExpression="Competitor_Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Gender" runat="server" SelectedValue='<%# Bind("Competitor_Gender") %>'>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Competitor_Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Competitor_ContactNo" HeaderText="ContactNo" SortExpression="Competitor_ContactNo" />
                <asp:BoundField DataField="Competitor_Website" HeaderText="Website" SortExpression="Competitor_Website" />
                <asp:BoundField DataField="Competitor_Photo" HeaderText="Photo" SortExpression="Competitor_Photo" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <asp:AccessDataSource ID="CompetitorData" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Competitors]" DeleteCommand="DELETE FROM [Competitors] WHERE [Competitor_ID] = ?" InsertCommand="INSERT INTO [Competitors] ([Competitor_ID], [Competitor_Salutation], [Competitor_Name], [Competitor_DoB], [Competitor_Email], [Competitor_Description], [Competitor_Country], [Competitor_Gender], [Competitor_ContactNo], [Competitor_Website], [Competitor_Photo]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Competitors] SET [Competitor_Salutation] = ?, [Competitor_Name] = ?, [Competitor_DoB] = ?, [Competitor_Email] = ?, [Competitor_Description] = ?, [Competitor_Country] = ?, [Competitor_Gender] = ?, [Competitor_ContactNo] = ?, [Competitor_Website] = ?, [Competitor_Photo] = ? WHERE [Competitor_ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_Gender" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
                <asp:Parameter Name="Competitor_Photo" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Competitor_Salutation" Type="String" />
                <asp:Parameter Name="Competitor_Name" Type="String" />
                <asp:Parameter Name="Competitor_DoB" Type="DateTime" />
                <asp:Parameter Name="Competitor_Email" Type="String" />
                <asp:Parameter Name="Competitor_Description" Type="String" />
                <asp:Parameter Name="Competitor_Country" Type="String" />
                <asp:Parameter Name="Competitor_Gender" Type="String" />
                <asp:Parameter Name="Competitor_ContactNo" Type="Int32" />
                <asp:Parameter Name="Competitor_Website" Type="String" />
                <asp:Parameter Name="Competitor_Photo" Type="String" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <p>
            Salutaion :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Salutation" runat="server"></asp:TextBox>
&nbsp;Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:Label ID="ErrorName" runat="server" ForeColor="Red" Text="Name must not be left blank" Visible="False"></asp:Label>
&nbsp;&nbsp; Gender:&nbsp;&nbsp;
            <asp:DropDownList ID="Gender" runat="server">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            DoB:
        </p>
        <asp:Calendar ID="DoB" runat="server"></asp:Calendar>
        <p>
            Email:&nbsp;
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="ErrorEmail" runat="server" ForeColor="Red" Text="Email is already in use" Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            Description:&nbsp;&nbsp;
            <asp:TextBox ID="Description" runat="server"></asp:TextBox>
        </p>
        <p>
            Country:&nbsp;
            <asp:TextBox ID="Country" runat="server"></asp:TextBox>
            <asp:Label ID="errorCountry" runat="server" ForeColor="Red" Text="Must enter country" Visible="False"></asp:Label>
        </p>
        <p>
            Contact Number:&nbsp;&nbsp;
            <asp:TextBox ID="ContactNumber" runat="server"></asp:TextBox>
        </p>
        <p>
            Website:&nbsp;&nbsp;
             <asp:TextBox ID="Website" runat="server"></asp:TextBox>
        </p>
        <p>
            Photo:&nbsp;&nbsp;
            <asp:FileUpload ID="Photo" runat="server" />
        </p>
        <p>
            <asp:Label ID="FileName" runat="server" Text="FileName" Visible="False"></asp:Label>
        </p>
        <asp:Button ID="AddCompetitorButton" runat="server" Text="Add Competitor" />
        <asp:SqlDataSource ID="AddCompetitor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="Insert Into Competitors (Competitor_Salutation, Competitor_Name, Competitor_DoB, Competitor_Email, Competitor_Description, Competitor_Country, Competitor_Gender, Competitor_ContactNo, Competitor_Website, Competitor_Photo) Values (@Salutation, @Name, @DoB, @Email, @Description, @Country, @Gender, @ContactNo, @Website, @Photo)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Competitors]">
            <InsertParameters>
                <asp:ControlParameter ControlID="Salutation" Name="Salutation" PropertyName="Text" />
                <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="DoB" Name="DoB" PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="Email" Name="Email" PropertyName="Text" />
                <asp:ControlParameter ControlID="Description" Name="Description" PropertyName="Text" />
                <asp:ControlParameter ControlID="Country" Name="Country" PropertyName="Text" />
                <asp:ControlParameter ControlID="Gender" Name="Gender" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ContactNumber" Name="ContactNo" PropertyName="Text" />
                <asp:ControlParameter ControlID="Website" Name="Website" PropertyName="Text" />
                <asp:ControlParameter ControlID="FileName" Name="Photo" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:AccessDataSource ID="GameData" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Games]"></asp:AccessDataSource>
        <br />
        <p style="font-size: xx-large">
            Register Competitor</p>
        <p>
            Competitor ID&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="CompID" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Game:&nbsp;
            <asp:DropDownList ID="GameList" runat="server" DataSourceID="GameDataList" DataTextField="Game_Name" DataValueField="Game_ID">
            </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="IDError" runat="server" ForeColor="Red" Text="Invalid ID number" Visible="False"></asp:Label>
        </p>
        <asp:AccessDataSource ID="GameDataList" runat="server" DataFile="App_Data\OlympicData.accdb" DeleteCommand="DELETE FROM `Games` WHERE `Game_ID` = ?" InsertCommand="INSERT INTO `Games` (`Game_ID`, `Game_Code`, `Game_Name`, `Game_DurationInHours`, `Game_Description`, `Game_RuleBooklet`) VALUES (?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `Game_ID`, `Game_Code`, `Game_Name`, `Game_DurationInHours`, `Game_Description`, `Game_RuleBooklet` FROM `Games`" UpdateCommand="UPDATE `Games` SET `Game_Code` = ?, `Game_Name` = ?, `Game_DurationInHours` = ?, `Game_Description` = ?, `Game_RuleBooklet` = ? WHERE `Game_ID` = ?">
            <DeleteParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Game_RuleBooklet" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_Code" Type="String" />
                <asp:Parameter Name="Game_Name" Type="String" />
                <asp:Parameter Name="Game_DurationInHours" Type="Int32" />
                <asp:Parameter Name="Game_Description" Type="String" />
                <asp:Parameter Name="Game_RuleBooklet" Type="String" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:Button ID="RegisterButton" runat="server" Text="Register" />
        <asp:SqlDataSource ID="AddRegistration" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="Insert into Registration (Game_ID, Competitor_ID) values (@Game, @Competitor)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Registration]">
            <InsertParameters>
                <asp:ControlParameter ControlID="GameList" Name="Game" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="CompID" Name="Competitor" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Competitor_ID" DataSourceID="AccessDataSource1" EmptyDataText="There are no data records to display." Visible="False">
            <Columns>
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor_ID" ReadOnly="True" SortExpression="Competitor_ID" InsertVisible="False" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT [Competitor_ID] FROM [Competitors] WHERE ([Competitor_ID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CompID" Name="Competitor_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AccessDataSource2" EmptyDataText="There are no data records to display." Visible="False">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" SortExpression="Game_ID" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor_ID" SortExpression="Competitor_ID" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="App_Data\OlympicData.accdb" SelectCommand="SELECT * FROM [Registration] WHERE ([Competitor_ID] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CompID" Name="Competitor_ID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="AccessDataSource3" EmptyDataText="There are no data records to display." Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Game_ID" HeaderText="Game_ID" SortExpression="Game_ID" />
                <asp:BoundField DataField="Competitor_ID" HeaderText="Competitor_ID" SortExpression="Competitor_ID" />
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="App_Data\OlympicData.accdb" DeleteCommand="DELETE FROM `Registration` WHERE `ID` = ?" InsertCommand="INSERT INTO `Registration` (`ID`, `Game_ID`, `Competitor_ID`) VALUES (?, ?, ?)" SelectCommand="SELECT `ID`, `Game_ID`, `Competitor_ID` FROM `Registration`" UpdateCommand="UPDATE `Registration` SET `Game_ID` = ?, `Competitor_ID` = ? WHERE `ID` = ?">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Game_ID" Type="Int32" />
                <asp:Parameter Name="Competitor_ID" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>
