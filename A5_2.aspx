<%@ Page Title="" Language="C#" MasterPageFile="~/Site5.master" AutoEventWireup="true" CodeFile="A5_2.aspx.cs" Inherits="A5_1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">
         .tableStyle {
            width: 97%;
        }

         .auto-style2 {
        width: 106px;
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
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="修正總審結果"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br /></td>
        </tr>
        <tr>
            <td style="vertical-align: top" rowspan="2">
                        <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsMediaUploadForJudging" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="MCID,MCYouTubeURL,MCCreatedDate,MCOrgStatus,MCTitle,dresult,dreview,MCApprovalStatus,mreview,mresult,DMCOrgStatus,MMCOrgStatus,PName" Width="490px" OnSelectedIndexChanged="gvVideo_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="MCYouTubeURL" HeaderText="MCYouTubeURL" SortExpression="MCYouTubeURL" Visible="False" />
                                <asp:BoundField DataField="MCTitle" HeaderText="影片標題" SortExpression="MCTitle">
                                <HeaderStyle Width="200px" />
                                <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MCCreatedDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="上傳日期" SortExpression="MCCreatedDate">
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MCOrgStatus" HeaderText="公開狀態" SortExpression="MCOrgStatus">
                                <HeaderStyle Width="60px" />
                                <ItemStyle Width="60px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MCApprovalStatus" HeaderText="審核狀態">
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
                        <asp:SqlDataSource ID="dsMediaUploadForJudging" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT MediaUpload.MCID, MediaUpload.MCYouTubeURL, MediaUpload.MCTitle, MediaUpload.MCCreatedDate, MediaUpload.MCOrgStatus, MediaUpload.MCApprovalStatus, ReviewDeptDetail.dreview, ReviewMain.mreview, ReviewMain.mresult, ReviewDeptDetail.dresult, ReviewDeptDetail.MCOrgStatus AS DMCOrgStatus, ReviewMain.MCOrgStatus AS MMCOrgStatus, Person.PName FROM MediaUpload INNER JOIN ReviewDeptDetail ON MediaUpload.MCID = ReviewDeptDetail.mcid INNER JOIN ReviewMain ON MediaUpload.MCID = ReviewMain.mcid INNER JOIN Person ON MediaUpload.PID = Person.PID WHERE (ReviewMain.pid = @PID) AND (ReviewMain.mresult &gt; -1)">
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
                <table>
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
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label6" runat="server" Text="第一審核者意見"></asp:Label>
                            </strong></td>
                        <td>
                            <asp:Label ID="lbl1stComment" runat="server" ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="是否通過："></asp:Label>
                            <asp:Label ID="lblPass1" runat="server" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label21" runat="server" Text="建議公開方式："></asp:Label>
                            <asp:Label ID="lblOpen1" runat="server" ForeColor="#CC3300"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label7" runat="server" Text="第二審核者意見"></asp:Label>
                            </strong></td>
                        <td>
                            <asp:Label ID="lbl2stComment" runat="server" ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="是否通過："></asp:Label>
                            <asp:Label ID="lblPass2" runat="server" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label23" runat="server" Text="建議公開方式："></asp:Label>
                            <asp:Label ID="lblOpen2" runat="server" ForeColor="#CC3300"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label8" runat="server" Text="第三審核者意見"></asp:Label>
                            </strong></td>
                        <td>
                            <asp:Label ID="lbl3stComment" runat="server" ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="是否通過："></asp:Label>
                            <asp:Label ID="lblPass3" runat="server" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label25" runat="server" Text="建議公開方式："></asp:Label>
                            <asp:Label ID="lblOpen3" runat="server" ForeColor="#CC3300"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label9" runat="server" Text="系主任審核意見"></asp:Label>
                            </strong></td>
                        <td>
                            <asp:Label ID="lblDeptComment" runat="server" ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="是否通過："></asp:Label>
                            <asp:Label ID="lblPassDept" runat="server" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label27" runat="server" Text="建議公開方式："></asp:Label>
                            <asp:Label ID="lblOpenDept" runat="server" ForeColor="#CC3300"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">審核意見</td>
                        <td>
                            <asp:TextBox ID="txtmreview" runat="server" Height="79px" Width="295px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">公開程度</td>
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
                            <asp:DropDownList ID="ddlmresult" runat="server">
                                <asp:ListItem Value="1">通過</asp:ListItem>
                                <asp:ListItem Value="0">不通過</asp:ListItem>
                                <asp:ListItem Value="-1">尚未審核</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnsent" runat="server" Text="修正" OnClick="btnsent_Click" style="width: 50px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnRetrial" runat="server" Text="退回重審" OnClick="btnRetrial_Click" Width="96px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
