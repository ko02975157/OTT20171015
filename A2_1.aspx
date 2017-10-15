<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="A2_1.aspx.cs" Inherits="A2_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .tableStyle {
            width: 90%;
        }
        .col1Style {
            width: 50%;
        }


        .auto-style2 {
        width: 57%;
    }
        .auto-style3 {
        width: 99%;
    }
        .auto-style4 {
        text-align: center;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style3" style="background-color: #CCFFCC">
        <tr>
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="設定審核者"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br /></td>
        </tr>
        <tr>
            <td style="vertical-align: top" class="auto-style2">
                        <div class="auto-style4">
                        <asp:GridView ID="gvReviewerSet" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsReviewer1" ForeColor="#333333" GridLines="None"  AllowPaging="True" Width="490px" OnSelectedIndexChanged="GvReviewerSet__SelectedIndexChanged" DataKeyNames="PName,PCode,PRoleType,PEducation,PEmail,PRegion,PTitle,PDepartment,PCollege,PBirthDate,PPassword,PUserName">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="PName" HeaderText="姓名" SortExpression="PName">
                                </asp:BoundField>
                                <asp:BoundField DataField="roletypeDescription" HeaderText="角色" SortExpression="roletypeDescription">
                                </asp:BoundField>
                                <asp:BoundField DataField="PSuperDescription" HeaderText="權限" SortExpression="PSuperDescription">
                                </asp:BoundField>
                                <asp:BoundField DataField="PTitleName" HeaderText="職稱" SortExpression="PTitleName">
                                </asp:BoundField>
                                <asp:BoundField DataField="PDepartmentName" HeaderText="系" SortExpression="PDepartmentName" />
                                <asp:BoundField DataField="PCollegeName" HeaderText="院" SortExpression="PCollegeName" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="dsReviewer1" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT Person.PID, Person.PName, Person.PCode, Person.PRoleType, RoleType.roletypeDescription, Person.PCreatedOn, Person.PEmail, Person.PUserName, Person.PPassword, Person.PBirthDate, Person.PEducation, Person.PRegion, Person.PSuper, PSuperType.PSuperDescription, Person.PTitle, PTitle.PTitleName, Person.PDepartment, PDepartment.PDepartmentName, Person.PCollege, PCollege.PCollegeName FROM Person INNER JOIN PSuperType ON Person.PSuper = PSuperType.PSuper INNER JOIN PDepartment ON Person.PDepartment = PDepartment.PDepartmentNumber INNER JOIN PCollege ON Person.PCollege = PCollege.PCollegeNumber INNER JOIN RoleType ON Person.PRoleType = RoleType.roletype INNER JOIN PTitle ON Person.PTitle = PTitle.PTitleNumber
WHERE Person.PRoleType=2 and ((Person.PSuper=1)or(Person.PSuper=2))"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsEducation" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [Education]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsRoleType" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [RoleType]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [PDepartment]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [PCollege]"></asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [Reig]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dsPTitle" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [PTitle]"></asp:SqlDataSource>
            </td>
            <td>
                
                    <asp:Label ID="Label6" runat="server" Text="姓名"></asp:Label>
&nbsp;<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="學生/教職員編號"></asp:Label>
                    <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="角色"></asp:Label>
                    <asp:DropDownList ID="ddlroletype" runat="server" DataSourceID="dsRoleType" DataTextField="roletypeDescription" DataValueField="roletype">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="信箱"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="帳號"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnCheck" runat="server" OnClick="BtnCheck_Click" Text="檢查" />
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="密碼"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="生日"></asp:Label>
                    <asp:DropDownList ID="ddlYear" runat="server">
                    <asp:ListItem>1950</asp:ListItem>
                            <asp:ListItem>1951</asp:ListItem>
                            <asp:ListItem>1952</asp:ListItem>
                            <asp:ListItem>1953</asp:ListItem>
                            <asp:ListItem>1954</asp:ListItem>
                            <asp:ListItem>1955</asp:ListItem>
                            <asp:ListItem>1956</asp:ListItem>
                            <asp:ListItem>1957</asp:ListItem>
                            <asp:ListItem>1958</asp:ListItem>
                            <asp:ListItem>1959</asp:ListItem>   
                            <asp:ListItem>1960</asp:ListItem>
                            <asp:ListItem>1961</asp:ListItem>
                            <asp:ListItem>1962</asp:ListItem>
                            <asp:ListItem>1963</asp:ListItem>
                            <asp:ListItem>1964</asp:ListItem>
                            <asp:ListItem>1965</asp:ListItem>
                            <asp:ListItem>1966</asp:ListItem>
                            <asp:ListItem>1967</asp:ListItem>
                            <asp:ListItem>1968</asp:ListItem>
                            <asp:ListItem>1969</asp:ListItem>
                            <asp:ListItem>1970</asp:ListItem>
                            <asp:ListItem>1971</asp:ListItem>
                            <asp:ListItem>1972</asp:ListItem>
                            <asp:ListItem>1973</asp:ListItem>
                            <asp:ListItem>1974</asp:ListItem>
                            <asp:ListItem>1975</asp:ListItem>
                            <asp:ListItem>1976</asp:ListItem>
                            <asp:ListItem>1977</asp:ListItem>
                            <asp:ListItem>1978</asp:ListItem>
                            <asp:ListItem>1979</asp:ListItem>
                            <asp:ListItem>1980</asp:ListItem>
                            <asp:ListItem>1981</asp:ListItem>
                            <asp:ListItem>1982</asp:ListItem>
                            <asp:ListItem>1983</asp:ListItem>
                            <asp:ListItem>1984</asp:ListItem>
                            <asp:ListItem>1985</asp:ListItem>
                            <asp:ListItem>1986</asp:ListItem>
                            <asp:ListItem>1987</asp:ListItem>
                            <asp:ListItem>1988</asp:ListItem>
                            <asp:ListItem>1989</asp:ListItem>
                            <asp:ListItem>1990</asp:ListItem>
                            <asp:ListItem>1991</asp:ListItem>
                            <asp:ListItem>1992</asp:ListItem>
                            <asp:ListItem>1993</asp:ListItem>
                            <asp:ListItem>1994</asp:ListItem>
                            <asp:ListItem>1995</asp:ListItem>
                            <asp:ListItem>1996</asp:ListItem>
                            <asp:ListItem>1997</asp:ListItem>
                            <asp:ListItem>1998</asp:ListItem>
                            <asp:ListItem>1999</asp:ListItem>
                            <asp:ListItem>2000</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
                            <asp:ListItem>2003</asp:ListItem>
                            <asp:ListItem>2004</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label18" runat="server" Text="年"></asp:Label>
                    <asp:DropDownList ID="ddlMonth" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>    
                    </asp:DropDownList>
                    <asp:Label ID="Label19" runat="server" Text="月"></asp:Label>
                    <asp:DropDownList ID="ddlDay" runat="server">
                     <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label20" runat="server" Text="日"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="教育程度"></asp:Label>
                    <asp:DropDownList ID="ddlEducation" runat="server" DataSourceID="dsEducation" DataTextField="edu" DataValueField="edu">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="居住城市"></asp:Label>
                    <asp:DropDownList ID="ddlRegion" runat="server" DataSourceID="dsRegion" DataTextField="rei" DataValueField="rei">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="職稱"></asp:Label>
                    <asp:DropDownList ID="ddlPtitle" runat="server" DataSourceID="dsPTitle" DataTextField="PTitleName" DataValueField="PTitleNumber">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label16" runat="server" Text="學系"></asp:Label>
                    <asp:DropDownList ID="ddlPDepartment" runat="server" DataSourceID="dsDepartment" DataTextField="PDepartmentName" DataValueField="PDepartmentNumber">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Label ID="Label17" runat="server" Text="學院"></asp:Label>
                    <asp:DropDownList ID="ddlPCollege" runat="server" DataSourceID="dsCollege" DataTextField="PCollegeName" DataValueField="PCollegeNumber">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnAdd" runat="server" Text="新增" OnClick="BtnAdd_Click" />
                    <asp:Button ID="BtnChange" runat="server" Text="修改" OnClick="BtnChange_Click" Visible="False" />
                    <asp:Button ID="BtnCancal" runat="server" Text="取消" Visible="False" />
                    
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
                        <td>&nbsp;</td>
        </tr>
    </table>
 
</asp:Content>

