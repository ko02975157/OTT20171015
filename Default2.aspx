<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
        .auto-style2
        {
            width: 457px;
        }
        .auto-style3
        {
            width: 457px;
            height: 37px;
        }
    </style>
</head>
<body style="width: 514px">
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1" style="background-color: #CCFFCC">
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="員工資料處理"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <div style="width: 446px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server" Height="25px" Text="員工代號"></asp:Label>
                        　<asp:TextBox ID="txtNo" runat="server" Height="15px" Width="100px"></asp:TextBox>
&nbsp;&nbsp;
                        <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查詢" />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Height="25px" Text="員工姓名"></asp:Label>
                        　<asp:TextBox ID="txtName" runat="server" Height="15px" Width="100px"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" Height="25px" Text="員工身份證"></asp:Label>
                        <asp:TextBox ID="txtID" runat="server" Height="15px" Width="100px"></asp:TextBox>
                        <br />
                        <br />
                        　　<asp:Label ID="Label6" runat="server" Height="25px" Text="員工地址"></asp:Label>
                        　<asp:TextBox ID="txtAddress" runat="server" Height="15px" Width="100px"></asp:TextBox>
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Height="25px" Text="員工電話"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtTelNo" runat="server" Height="15px" Width="100px"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" Height="25px" Text="員工底薪"></asp:Label>
                        　<asp:TextBox ID="txtSalary" runat="server" Height="15px" Width="100px"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCreate" runat="server" Height="30px" OnClick="btnCreate_Click" Text="建立員工資料" ValidationGroup="1" Width="91px" />
                    <asp:Button ID="btnUpdate" runat="server" Height="30px" OnClick="btnUpdate_Click" Text="更改員工資料" Width="94px" />
                    <asp:Button ID="btnDelete" runat="server" Height="30px" OnClick="btnDelete_Click" Text="刪除員工資料" ValidationGroup="1" Width="94px" />
                    <asp:Button ID="btnClear" runat="server" Height="30px" OnClick="BtnClear_Click" Text="清除" Width="58px" />
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
