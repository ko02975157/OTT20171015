<%@ Page Title="" Language="C#" MasterPageFile="~/Site0.master" AutoEventWireup="true" CodeFile="MAIN.aspx.cs" Inherits="MAIN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .tableStyle {
            width: 90%;
        }
        .col1Style {
            width: 50%;
        }
        .auto-style3 {
            width: 555px;
            height: 363px;
        }
        .auto-style4 {
            width: 99%;
        }
        .auto-style5 {
            width: 203px;
        }
        .auto-style6 {
            width: 26%;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">   
    <table class="auto-style4" style="background-color: #CCFFCC">
        <tr>
            <td style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="登        入"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br /></td>
            <td style="vertical-align: top" rowspan="3">
                <img alt="修飾圖片" class="auto-style3" src="Images/main.PNG" />
            </td>
        </tr>
        <tr>
            <td class="auto-style6" style="vertical-align: top">
                <div class="auto-style5">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Height="25px" Text="帳號" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        　<br />
&nbsp;<asp:TextBox ID="txtUsername" runat="server" Height="20px" Width="160px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Height="25px" Text="密碼" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC"></asp:Label>
                        &nbsp;<br />
&nbsp;<asp:TextBox ID="txtPassword" runat="server" Height="20px" Width="160px" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" TextMode="Password"></asp:TextBox>
                    &nbsp;
                        <br />
                    <br />&nbsp;
                    <asp:Button ID="btnLogin" runat="server" Height="30px" OnClick="BtnLogin_Click" Text="登入" Width="70px" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnRegistration" runat="server" Height="30px" OnClick="BtnRegistration_Click" Text="註冊" Width="70px" />
                    </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" style="vertical-align: top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
        </tr>
    </table>
 
</asp:Content>

