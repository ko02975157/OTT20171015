<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="A2_2.aspx.cs" Inherits="A2_2" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
         .tableStyle {
            width: 97%;
        }

    .auto-style1 {
        width: 84px;
    }

         .auto-style10 {
             width: 241px;
             height: 188px;
             position: absolute;
             top: 268px;
             left: 335px;
             z-index: 1;
         }
         .auto-style11 {
             width: 214px;
             height: 196px;
             position: absolute;
             top: 226px;
             left: 334px;
             z-index: 1;
         }

    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    <Scripts>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
        </asp:ScriptReference>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
        </asp:ScriptReference>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
        </asp:ScriptReference>
    </Scripts>
</telerik:RadScriptManager>
<table class="tableStyle" style="background-color: #CCFFCC">
        <tr>
            <td colspan="2" style="text-align: left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="查看影片設定及狀況"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br /></td>
        </tr>
        <tr>
            <td style="vertical-align: top" rowspan="2">
                    <strong>
                    <asp:Label ID="Label6" runat="server" Text="開始日期 : "></asp:Label>
                    <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
&nbsp;&nbsp;</strong><asp:Button ID="InterviewDateBtn" runat="server" OnClick="InterviewDateBtn_Click" style="z-index: 1" Text="選擇日期" />
                    <asp:Calendar ID="InterviewCalendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" CssClass="auto-style11" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;<asp:Label ID="Label8" runat="server" Text="結束日期 : "></asp:Label>
                    <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
&nbsp;
                    <asp:Button ID="InterviewDateBtn2" runat="server" OnClick="InterviewDateBtn2_Click" Text="選取日期" />
                    <br />
                    <br />
                    <asp:Button ID="btn" runat="server" Text="選取範圍" OnClick="Button1_Click" />
                    <br />
                        <asp:Calendar ID="InterviewCalendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" CssClass="auto-style10" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="InterviewCalendar2_SelectionChanged" Visible="False" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                        <asp:GridView ID="gvForJudgingVideo" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsMediaUploadForJudging" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="MCID,MCYouTubeURL,MCCreatedDate,PName,MCOrgStatus,MCTitle,MyMCOrgStatus" Width="490px" OnSelectedIndexChanged="gvForJudgingVideo_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="MCYouTubeURL" HeaderText="MCYouTubeURL" SortExpression="MCYouTubeURL" Visible="False" />
                                <asp:BoundField DataField="MCTitle" HeaderText="影片標題" SortExpression="MCTitle">
                                <HeaderStyle Width="300px" />
                                <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MCCreatedDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="上傳日期" SortExpression="MCCreatedDate">
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MCOrgStatus" HeaderText="公開狀態" SortExpression="MCOrgStatus">
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
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
                        <asp:SqlDataSource ID="dsMediaUploadForJudging" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT MediaUpload.MCID, MediaUpload.MCYouTubeURL, MediaUpload.MCTitle, MediaUpload.MCCreatedDate, MediaUpload.MCOrgStatus, ReviewDeptDetail.MCOrgStatus as MyMCOrgStatus, ReviewDeptDetail.dresult, Person.PName FROM MediaUpload INNER JOIN ReviewDeptDetail ON MediaUpload.MCID = ReviewDeptDetail.mcid INNER JOIN Person ON MediaUpload.PID = Person.PID WHERE (ReviewDeptDetail.PID = @PID) AND (ReviewDeptDetail.dresult = -1)">
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
            </td>
            <td style="vertical-align: top">
                <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" Height="300px" Culture="zh-TW">
                </telerik:RadMediaPlayer>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                 <table style="background-color: #CCFFCC">
                    <tr>
                        <td class="auto-style1">影音代號</td>
                        <td>
                            <asp:Label ID="lblmcid" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">影音標題</td>
                        <td>
                            <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">申請者姓名</td>
                        <td>
                            <asp:Label ID="lblPName" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">申請時間</td>
                        <td>
                            <asp:Label ID="lbldreceiveTime" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">審核意見</td>
                        <td>
                            <asp:TextBox ID="txtdreview" runat="server" Height="79px" Width="295px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">建議公開程度</td>
                        <td>
                            <asp:DropDownList ID="ddlMCOrgStatus" runat="server">
                                <asp:ListItem>校外公開</asp:ListItem>
                                <asp:ListItem>校內公開</asp:ListItem>
                                <asp:ListItem>限閱</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">審核結果</td>
                        <td>
                            <asp:DropDownList ID="ddldresult" runat="server">
                                <asp:ListItem Value="1">通過</asp:ListItem>
                                <asp:ListItem Value="0">不通過</asp:ListItem>
                                <asp:ListItem Value="-1">尚未審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                     <tr>
                        <td class="auto-style1">審核狀態</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="1">已審核</asp:ListItem>
                                <asp:ListItem Value="-1">尚未審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
