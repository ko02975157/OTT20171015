<%@ Page Title="" Language="C#" MasterPageFile="~/Site5.master" AutoEventWireup="true" CodeFile="A5.aspx.cs" Inherits="A5" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
      <style type="text/css">

        .auto-style1
        {
            width: 100%;
        }
        .auto-style2
        {
        width: 105px;
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
        <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" Culture="zh-TW">
</telerik:RadMediaPlayer>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        &nbsp;<table class="auto-style1" style="background-color: #CCFFCC">
            <tr>
                <td class="auto-style2">院長代號</td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtPID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">送至時間</td>
                <td class="auto-style12">
                    <asp:Label ID="lblreceivetime" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">審核意見</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtreview" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">最終審核結果</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="ddlresult" runat="server">
                        <asp:ListItem>1.公開</asp:ListItem>
                        <asp:ListItem>2.校園內公開</asp:ListItem>
                        <asp:ListItem>3.限閱</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">送出時間</td>
                <td class="auto-style12">
                    <asp:Label ID="lblsendtime" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style12">
        <asp:Button ID="btncorrect" runat="server" Text="確認" />
        <asp:Button ID="btnreturn" runat="server" Text="退回重審" />
                </td>
            </tr>
        </table>
    <asp:Panel ID="Panel3" runat="server" Height="166px">
        <table class="auto-style1" style="background-color: #CCFFCC">
            <tr>
                <td class="auto-style2">系主任代號</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPID0" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">審核意見</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtreview0" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">審核結果</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="ddlresult0" runat="server">
                        <asp:ListItem>1.公開</asp:ListItem>
                        <asp:ListItem>2.校園內公開</asp:ListItem>
                        <asp:ListItem>3.限閱</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table class="auto-style1" style="background-color: #CCFFCC">
            <tr>
                <td class="auto-style2">初審人員代號</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtPID1" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style14">初審人員代號</td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtPID2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style20">初審人員代號</td>
                <td>
                    <asp:TextBox ID="txtPID3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">審查意見</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtreview1" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style14">審查意見</td>
                <td class="auto-style19">
                    <asp:TextBox ID="txtreview2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style20">審查意見</td>
                <td>
                    <asp:TextBox ID="txtreview3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">審查結果</td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlresult1" runat="server">
                        <asp:ListItem>1.公開</asp:ListItem>
                        <asp:ListItem>2.校園內公開</asp:ListItem>
                        <asp:ListItem>3.限閱</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style14">審查結果</td>
                <td class="auto-style19">
                    <asp:DropDownList ID="ddlresult2" runat="server">
                        <asp:ListItem>1.公開</asp:ListItem>
                        <asp:ListItem>2.校園內公開</asp:ListItem>
                        <asp:ListItem>3.限閱</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style20">審查結果</td>
                <td>
                    <asp:DropDownList ID="ddlresult3" runat="server">
                        <asp:ListItem>1.公開</asp:ListItem>
                        <asp:ListItem>2.校園內公開</asp:ListItem>
                        <asp:ListItem>3.限閱</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>

