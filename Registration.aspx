<%@ Page Title="" Language="C#" MasterPageFile="~/Site0.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .auto-style1
        {
            width: 100%;
        }
        .auto-style2
        {
          width: 465px;
            height: 491px;
        }
        .auto-style3
        {
            width: 572px;
            height: 37px;
        }
      .auto-style5 {
          margin-top: 0px;
      }
      .auto-style6 {
        width: 572px;
        text-align: center;
    }
        .auto-style7 {
            width: 572px;
        }
        .auto-style12 {
            text-align: center;
            width: 223px;
        }
        .auto-style13 {
            width: 224px;
            text-align: center;
            height: 65px;
        }
        .auto-style15 {
            margin-left: 0px;
        }
        .auto-style16 {
            width: 221px;
            text-align: center;
            height: 65px;
        }
        .auto-style17 {
            width: 102%;
            height: 413px;
        }
        .auto-style18 {
            width: 100%;
            height: 451px;
        }
        .auto-style19 {
            width: 465px;
            height: 504px;
            text-align: center;
        }
        .auto-style20 {
            width: 223px;
            text-align: center;
            height: 65px;
        }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <table class="auto-style1" style="background-color: #CCFFCC">
        <tr>
            <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="會員註冊"></asp:Label>
                    <br /></td>
            
        </tr>
        <tr>
            <td class="auto-style7">
                <div class="auto-style2">
                        &nbsp;&nbsp;<br />
                        <table class="auto-style17">
                            <tr>
                                <td class="auto-style13">
                        <asp:Label ID="Label1" runat="server" Height="25px" Text="姓名" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style12"> <asp:TextBox ID="txtName" runat="server" Height="20px" Width="144px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13">
                        <asp:Label ID="Label2" runat="server" Height="25px" Text="學生/教職員編號" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style12"><asp:TextBox ID="txtCode" runat="server" Height="20px" Width="144px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13">
                        <asp:Label ID="Label3" runat="server" Height="25px" Text="角色" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style20"><asp:DropDownList ID="ddlroletype" runat="server" DataSourceID="dsRoleType" DataTextField="roletypeDescription" DataValueField="roletype" Font-Size="Medium">
                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13"> <asp:Label ID="Label6" runat="server" Height="25px" Text="信箱" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style20"> <asp:TextBox ID="txtEmail" runat="server" Height="20px" Width="239px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" CssClass="auto-style5"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13"><asp:Label ID="Label20" runat="server" Height="25px" Text="帳號" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style20"> <asp:TextBox ID="txtUsername" runat="server" Height="20px" Width="167px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
                                &nbsp;<asp:Button ID="BtnCheck" runat="server" OnClick="BtnCheck_Click" Text="檢查" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style13"><asp:Label ID="Label4" runat="server" Height="25px" Text="密碼" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style20"> <asp:TextBox ID="txtPassword" runat="server" Height="20px" Width="167px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        &nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="BtnRegistration" runat="server" OnClick="BtnRegistration_Click1" Text="註冊" Width="85px" />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="dsRoleType" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [RoleType]"></asp:SqlDataSource>
                    <br />
                        　&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <br />
                    <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
               
            </td>
            <td><div class="auto-style19">
                        <table class="auto-style18">
                            <tr>
                                <td class="auto-style16"><asp:Label ID="Label19" runat="server" Height="25px" Text="生日" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style13"><asp:DropDownList ID="ddlYear" runat="server" CssClass="auto-style15" Font-Size="Medium">
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
                        <asp:Label ID="Label16" runat="server" Height="25px" Text="年" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                                    <asp:DropDownList ID="ddlMonth" runat="server" Font-Size="Medium">
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
                                    <asp:Label ID="Label17" runat="server" Height="25px" Text="月" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                                    <asp:DropDownList ID="ddlDay" runat="server" Font-Size="Medium">
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
                                    <asp:Label ID="Label18" runat="server" Height="25px" Text="日" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16"> <asp:Label ID="Label11" runat="server" Height="25px" Text="教育程度" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style13"> <asp:DropDownList ID="ddlEducation" runat="server" DataSourceID="dsEducation" DataTextField="edu" DataValueField="edu" Font-Size="Medium">
                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                        <asp:Label ID="Label12" runat="server" Height="25px" Text="居住城市" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style13"> <asp:DropDownList ID="ddlRegion" runat="server" DataSourceID="dsRegion" DataTextField="rei" DataValueField="rei" Font-Size="Medium">
                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16"><asp:Label ID="Label13" runat="server" Height="25px" Text="職稱" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC"></asp:Label>
                                </td>
                                <td class="auto-style13"> <asp:DropDownList ID="ddlPtitle" runat="server" DataSourceID="dsPTitle" DataTextField="PTitleName" DataValueField="PTitleNumber" Font-Size="Medium">
                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16"><asp:Label ID="Label14" runat="server" Height="25px" Text="學系" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC" CssClass="auto-style5" Width="54px"></asp:Label>
                                </td>
                                <td class="auto-style13">
                        <asp:DropDownList ID="ddlPDepartment" runat="server" DataSourceID="dsDepartment" DataTextField="PDepartmentName" DataValueField="PDepartmentNumber" Font-Size="Medium">
                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16"><asp:Label ID="Label15" runat="server" Height="25px" Text="學院" Font-Bold="True" Font-Size="Large" ForeColor="#0033CC" CssClass="auto-style5" Width="60px"></asp:Label>
                                </td>
                                <td class="auto-style13"><asp:DropDownList ID="ddlPCollege" runat="server" DataSourceID="dsCollege" DataTextField="PCollegeName" DataValueField="PCollegeNumber" Font-Size="Medium">
                        </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="BtnClear" runat="server" OnClick="BtnClear_Click" Text="消除" />
                        &nbsp;&nbsp;&nbsp;
                        &nbsp;　<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        　 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <asp:SqlDataSource ID="dsEducation" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [Education]"></asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [Reig]"></asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <asp:SqlDataSource ID="dsPTitle" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [PTitle]"></asp:SqlDataSource>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:SqlDataSource ID="dsDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [PDepartment]"></asp:SqlDataSource>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:SqlDataSource ID="dsCollege" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT * FROM [PCollege]"></asp:SqlDataSource>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />&nbsp;
                    </div>&nbsp;</td>
        </tr>
         

        <tr>
            <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
            
        </tr>
    </table>


</asp:Content>
