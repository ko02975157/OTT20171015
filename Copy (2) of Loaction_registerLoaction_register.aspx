<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy (2) of Loaction_registerLoaction_register.aspx.cs" Inherits="test" %>
register-label-col
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 336px;
        }
        .period-label-col {
            width: 10px;
        }
        .time-label-col {
            width: 40px;
        }        
        .register-label-col {
            width: 60px;
        }
        .auto-style30 {
            width: 336px;
            height: 29px;
        }
        .auto-style31 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="場地查詢"></asp:Label>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style30">&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="請輸入日期"></asp:Label>
                    <asp:TextBox ID="txtStartDate" runat="server" Width="104px"></asp:TextBox>
                    <asp:TextBox ID="txtEndDate" runat="server" Width="98px"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style30">
                    <asp:Label ID="Label4" runat="server" Text="場地關鍵字查詢"></asp:Label>
                    <asp:TextBox ID="txtPlace" runat="server"></asp:TextBox>
                    <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查詢" />
                </td>
                <td class="auto-style31">
                    <asp:Label ID="lblLName" runat="server" style="text-align: center"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Text="登記表"></asp:Label>
                    <asp:Label ID="lblLNO" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top">
                    <asp:GridView ID="gdViewPlace" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gdViewPlace_SelectedIndexChanged" Width="286px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Height="248px">
                        <Columns>
                            <asp:CommandField EditText="選取" HeaderText="選取" SelectText="選取" ShowSelectButton="True" />
                            <asp:BoundField DataField="LNo" HeaderText="代號" />
                            <asp:BoundField DataField="LName" HeaderText="場地名稱" />
                            <asp:BoundField DataField="LPNo" HeaderText="管理者代號" />
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    -</td>
                <td>
        <table border="1">
            <tr>
                <td class="period-label-col">&nbsp;</td>
                <td class="time-label-col">時間</td>
                <td class="register-label-col">
                    <asp:Label ID="lbl1" runat="server"></asp:Label>
                </td>
                <td class="register-label-col">
                    <asp:Label ID="lbl2" runat="server"></asp:Label>
                </td>
                <td class="register-label-col">
                    <asp:Label ID="lbl3" runat="server"></asp:Label>
                </td>
                <td class="register-label-col">
                    <asp:Label ID="lbl4" runat="server"></asp:Label>
                </td>
                <td class="register-label-col">
                    <asp:Label ID="lbl5" runat="server"></asp:Label>
                </td>
                <td class="register-label-col">
                    <asp:Label ID="lbl6" runat="server"></asp:Label>
                </td>
                <td class="register-label-col">
                    <asp:Label ID="lbl7" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="period-label-col">1</td>
                <td class="time-label-col">08-09</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B1" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B15" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B29" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B43" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B57" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B71" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B85" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">2</td>
                <td class="time-label-col">09-10</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B2" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B16" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B30" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B44" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B58" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B72" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B86" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">3</td>
                <td class="time-label-col">10-11</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B3" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B17" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B31" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B45" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B59" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B73" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B87" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">4</td>
                <td class="time-label-col">11-12</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B4" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B18" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B32" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B46" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B60" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B74" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B88" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">5</td>
                <td class="time-label-col">12-13</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B5" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B19" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B33" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B47" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B61" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B75" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B89" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">6</td>
                <td class="time-label-col">13-14</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B6" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B20" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B34" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B48" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B62" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B76" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B90" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">7</td>
                <td class="time-label-col">14-15</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B7" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B21" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B35" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B49" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B63" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B77" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B91" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">8</td>
                <td class="time-label-col">15-16</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B8" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B22" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B36" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B50" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B64" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B78" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B92" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">9</td>
                <td class="time-label-col">16-17</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B9" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B23" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B37" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B51" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B65" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B79" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B93" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">10</td>
                <td class="time-label-col">17-18</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B10" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B24" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B38" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B52" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B66" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B80" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B94" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">11</td>
                <td class="time-label-col">18-19</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B11" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B25" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B39" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B53" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B67" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B81" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B95" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">12</td>
                <td class="time-label-col">19-20</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B12" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B26" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B40" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B54" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B68" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B82" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B96" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">13</td>
                <td class="time-label-col">20-21</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B13" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B27" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B41" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B55" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B69" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B83" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B97" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="period-label-col">14</td>
                <td class="time-label-col">21-22</td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B14" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B28" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B42" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B56" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B70" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B84" runat="server" />
                </td>
                <td class="register-label-col">
                    <asp:CheckBox ID="B98" runat="server" />
                </td>
            </tr>
            </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td style="text-align:center">
                    <asp:Button ID="btnRegister" runat="server" style="text-align: center" Text="確認登記" Width="73px" OnClick="btnRegister_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
