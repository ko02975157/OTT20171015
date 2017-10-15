<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="A1-1.aspx.cs" Inherits="A1_1" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<script runat="server">

  
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .tableStyle {
            width: 90%;
        }
        .col1Style {
            width: 50%;
        }

    .auto-style1 {
        width: 50%;
        height: 52px;
    }
    .auto-style2 {
        height: 52px;
            width: 452px;
        }
    .auto-style3 {
        width: 97%;
        height: 503px;
    }

        .auto-style4 {
            width: 50%;
            height: 440px;
        }
        .auto-style5 {
            height: 183px;
        }

    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">   
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
    </telerik:RadStyleSheetManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
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
    <table class="auto-style3" style="background-color: #CCFFCC; ">
        <tr>
            <td class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="影音檔上傳"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br /></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="YouTubeURL" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp; <asp:TextBox ID="radtxtYouTubeURL" runat="server" Width="283px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" AutoPostBack="True" OnTextChanged="radtxtYouTubeURL_TextChanged"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;<br />
                        <asp:Label ID="lblTitle" runat="server" Text="標題" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp;　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtTitle" runat="server" Width="283px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblTitle0" runat="server" Text="上傳者" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        <br />
                        <asp:Label ID="lblTitle2" runat="server" Text="系名稱" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDepartment" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        <br />
                        <asp:Label ID="lblTitle3" runat="server" Text="公開狀態" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:DropDownList ID="ddlOrgStatus" runat="server">
                            <asp:ListItem>校內公開</asp:ListItem>
                            <asp:ListItem>對外公開</asp:ListItem>
                            <asp:ListItem>限閱</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="lblTitle4" runat="server" Text="限閱時須輸入的密碼" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtRestrictPW" runat="server" Width="219px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
                        <br />
                        <br />
                        <br />

                    <asp:Button ID="btnMediaUpload" runat="server" Height="30px" OnClick="btnMediaUpload_Click1" Text="上傳影片" ValidationGroup="1" Width="80px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnClean" runat="server" Height="30px" OnClick="btnClean_Click1" Text="清除" Width="80px" />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Label ID="Label9" runat="server" ForeColor="#FF3300" Text="請注意：影片上傳會自動指定三位審查老師"></asp:Label>
                        <br />
                        <asp:Label ID="Label10" runat="server" ForeColor="#FF3300" Text="三位老師審查後會自動彙至系主任及院長審查"></asp:Label>

            </td>
            <td style="vertical-align: top">
    <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" style="z-index: 1" Culture="zh-TW" Height="400px">
</telerik:RadMediaPlayer>
            </td>
        </tr>
        </table>
 
</asp:Content>

