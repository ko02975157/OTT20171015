<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="A2_3.aspx.cs" Inherits="A2_3" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<script runat="server">


</script>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
         .tableStyle {
            width: 97%;
        }

    .auto-style1 {
        width: 84px;
    }

         .auto-style2 {
             width: 84px;
             height: 23px;
         }
         .auto-style3 {
             height: 23px;
         }

         .auto-style4 {
             height: 275px;
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
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="審核修改與撤銷"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br /></td>
        </tr>
        <tr>
            <td style="vertical-align: top" rowspan="2">
                    <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="待審核清單"></asp:Label>
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
            <td style="vertical-align: top" class="auto-style4">
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
                        <td class="auto-style2">審核狀態</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="ddlMCApprovalStatus" runat="server">
                                <asp:ListItem Value="1">已審核</asp:ListItem>
                                <asp:ListItem Value="-1">尚未審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                        <td colspan="2">
                            <asp:Button ID="btnupdate" runat="server" Text="修改" OnClick="btnupdate_Click" Height="21px" Width="46px" />
                            <asp:Button ID="btncancal" runat="server" Text="取消" OnClick="btnsent_Click" Height="20px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
