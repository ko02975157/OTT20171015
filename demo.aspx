<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="demo" %>

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
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1" style="background-color: #CCFFCC">
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
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
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="25px" Text="員工代號"></asp:Label>
                        　 
                        <asp:TextBox ID="txtNo" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="20px" Width="144px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="25px" Text="員工姓名"></asp:Label>
                        &nbsp;　<asp:TextBox ID="txtName" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="20px" Width="144px"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="25px" Text="員工身份證"></asp:Label>
                        <asp:TextBox ID="txtID" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="20px" Width="128px"></asp:TextBox>
                        <br />
                        　 　<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="25px" Text="員工地址"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtAddress" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="20px" Width="234px"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="25px" Text="員工電話"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtTelNo" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="20px" Width="129px"></asp:TextBox>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="25px" Text="員工底薪"></asp:Label>
                        　<asp:TextBox ID="txtSalary" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0033CC" Height="20px" Width="132px"></asp:TextBox>
                        <br />
                        <br />
                        &nbsp;
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCreate" runat="server" Height="30px" OnClick="btnCreate_Click" Text="建立員工資料" ValidationGroup="1" Width="91px" />
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
