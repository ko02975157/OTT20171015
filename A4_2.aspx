<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.master" AutoEventWireup="true" CodeFile="A4_2.aspx.cs" Inherits="A4_2" %>

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
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="查詢審核進度及意見"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br /></td>
        </tr>
        <tr>
            <td style="vertical-align: top" rowspan="2">
                        <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsMediaUploadForJudging" ForeColor="#333333" GridLines="None" AllowPaging="True" DataKeyNames="MCID,MCYouTubeURL,MCCreatedDate,MCOrgStatus,MCTitle,dresult,dreview,MCApprovalStatus,mreview,mresult,DMCOrgStatus,MMCOrgStatus" Width="490px" OnSelectedIndexChanged="gvVideo_SelectedIndexChanged">
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
                        <asp:SqlDataSource ID="dsMediaUploadForJudging" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT MediaUpload.MCID, MediaUpload.MCYouTubeURL, MediaUpload.MCTitle, MediaUpload.MCCreatedDate, MediaUpload.MCOrgStatus, MediaUpload.MCApprovalStatus, ReviewDeptDetail.dreview, ReviewMain.mreview, ReviewMain.mresult, ReviewDeptDetail.dresult, ReviewDeptDetail.MCOrgStatus AS DMCOrgStatus, ReviewMain.MCOrgStatus AS MMCOrgStatus FROM MediaUpload INNER JOIN ReviewDeptDetail ON MediaUpload.MCID = ReviewDeptDetail.mcid INNER JOIN ReviewMain ON MediaUpload.MCID = ReviewMain.mcid WHERE (ReviewDeptDetail.pid = @PID)">
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
                        <td class="auto-style2"><strong>
                            <asp:Label ID="Label10" runat="server" Text="院長審核意見"></asp:Label>
                            </strong></td>
                        <td>
                            <asp:Label ID="lblCollComment" runat="server" ForeColor="#CC3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Label ID="Label19" runat="server" Text="是否通過："></asp:Label>
                            <asp:Label ID="lblPassColl" runat="server" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label29" runat="server" Text="建議公開方式："></asp:Label>
                            <asp:Label ID="lblOpenColl" runat="server" ForeColor="#CC3300"></asp:Label>
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
