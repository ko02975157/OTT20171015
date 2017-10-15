<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.master" AutoEventWireup="true" CodeFile="A4.aspx.cs" Inherits="A4" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .auto-style1
        {
            width: 100%;
        }
        .auto-style2 {
        width: 105px;
    }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">   
        &nbsp;<table class="auto-style1" style="background-color: #CCFFCC">
        <tr>
            <td class="auto-style2">批次代號</td>
            <td class="auto-style12">
                <asp:Label ID="lblbatch" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">影音代號</td>
            <td class="auto-style12">
                <asp:Label ID="lblmcid" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">批次名稱</td>
            <td class="auto-style12">
                <asp:Label ID="lblbatchname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">成立時間</td>
            <td class="auto-style12">
                <asp:Label ID="lblcreattime" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">系主任代號</td>
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
            <td class="auto-style2">審核結果</td>
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
    <asp:Button ID="btnsent" runat="server" Text="送出" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel3" runat="server" Height="151px">
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

