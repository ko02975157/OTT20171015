<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LMangAudit.aspx.cs" Inherits="test" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1107px;
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
        .auto-style31 {
            height: 20px;
        }
        .auto-style32 {
            width: 513px;
        }
        .auto-style33 {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;場地管理者審核作業<br />
        <table class="auto-style1">
            <tr>
                <td>&nbsp;&nbsp;&nbsp; &nbsp;</td>
                <td class="auto-style31">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp; &nbsp;<asp:GridView ID="gdViewPlace" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gdViewPlace_SelectedIndexChanged" Width="1107px" CellPadding="4" Height="149px" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField EditText="選取" HeaderText="選取" SelectText="選取" ShowSelectButton="True" >
                            <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ASno" HeaderText="活動序號" >
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ADesc" HeaderText="活動說明" >
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ADept" HeaderText="登記單位" >
                            <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="APName" HeaderText="登記者姓名" >
                            <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ATel" HeaderText="登記者電話" >
                            <ItemStyle Width="140px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="APRes" HeaderText="審核結果" >
                            <ItemStyle Width="180px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ACompYN" HeaderText="電腦設備" >
                            <ItemStyle Width="140px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ASupYN" HeaderText="總務支援" >
                            <ItemStyle Width="90px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ACpRes" HeaderText="電腦簽核" >
                            <ItemStyle Width="90px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ASpRes" HeaderText="總務簽核" >
                            <ItemStyle Width="90px" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </td>
            </tr>
            </table>
        <br />
        <br />
        <br />
        <br />
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style33" style="background-color: #CCCCFF">
                    <asp:Label ID="Label21" runat="server" Text="審核:"></asp:Label>
                </td>
                <td class="auto-style33" style="background-color: #CCCCFF">
                    <asp:RadioButtonList ID="RBListAudit" runat="server" RepeatDirection="Horizontal" Width="130px">
                        <asp:ListItem Value="通過">通過</asp:ListItem>
                        <asp:ListItem>不通過</asp:ListItem>
                    </asp:RadioButtonList>
               </td>
               <td class="auto-style33" style="background-color: #CCCCFF"><asp:Label ID="Label22" runat="server" Height="20px" Text="不通過原因"></asp:Label>

                    <asp:TextBox ID="txtReson" runat="server" Height="20px" Width="316px"></asp:TextBox>

                    <asp:Button ID="Button1" runat="server" Font-Bold="True" Font-Size="Medium" OnClick="Button1_Click" Text="確認送出" />

           </td>
            </tr>
            <tr>
                <td class="auto-style33" style="background-color: #CCCCFF">
                    <asp:Label ID="Label23" runat="server" Text="地點"></asp:Label>
                </td>
                <td class="auto-style33" colspan="2" style="background-color: #CCCCFF">
&nbsp;<asp:RadioButtonList ID="RBListLocation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RBListLocation_SelectedIndexChanged" RepeatDirection="Horizontal">
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style32">
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
                <td style="vertical-align: top" colspan="2">
                    <asp:Label ID="Label1" runat="server" Height="15px">活動代號</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtASno" runat="server" Height="15px" Width="80px"></asp:TextBox>
                    <asp:Label ID="Label16" runat="server" Height="15px">活動名稱</asp:Label>
                    <asp:TextBox ID="txtADesc" runat="server" Height="15px" Width="261px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label2" runat="server" Height="15px">申請部門</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtADept" runat="server" Height="15px" Width="132px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Height="15px">申請者</asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtAPName" runat="server" Height="15px" Width="133px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label4" runat="server" Height="15px">連駱電話</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtATel" runat="server" Height="15px" Width="78px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label5" runat="server" Height="15px">電腦設備需求</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtACompYN" runat="server" Height="15px" Width="78px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" Height="15px">電腦設備需求說明</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtACompDesc" runat="server" Height="15px" Width="194px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label7" runat="server" Height="15px">總務設備需求</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtASupYN" runat="server" Height="15px" Width="78px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label8" runat="server" Height="15px">總務設備需求說明</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtASupDesc" runat="server" Height="15px" Width="198px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Height="15px">場地審核者代號</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtApNo" runat="server" Height="15px" Width="78px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" Height="15px">審核日期</asp:Label>
                &nbsp;<asp:TextBox ID="txtApDate" runat="server" Height="15px" Width="78px"></asp:TextBox>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label11" runat="server" Height="15px">審核結果</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtApRes" runat="server" Height="15px" Width="78px"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label12" runat="server" Height="15px">審核結果說明</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtApDesc" runat="server" Height="15px" Width="78px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Height="15px">電腦設備審核者代號</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtACpNo" runat="server" Height="15px" Width="78px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; 審核日期&nbsp; 
                    <asp:TextBox ID="txtACpDate" runat="server" Height="15px"></asp:TextBox>
&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label14" runat="server" Height="15px">審核結果</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtACpRes" runat="server" Height="15px" Width="78px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" Height="15px">審核結果說明</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtACpDesc" runat="server" Height="15px" Width="167px"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label17" runat="server" Height="15px">總務設備審核者代號</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtASpNo" runat="server" Height="15px" Width="90px"></asp:TextBox>
&nbsp;
                    <asp:Label ID="Label18" runat="server" Height="15px">審核日期</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtASpDate" runat="server" Height="15px"></asp:TextBox>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label19" runat="server" Height="15px">審核結果</asp:Label>
                    <asp:TextBox ID="txtASpRes" runat="server" Height="15px"></asp:TextBox>
&nbsp;
                    <asp:Label ID="Label20" runat="server" Height="15px">審核結果說明</asp:Label>
                &nbsp;
                    <asp:TextBox ID="txtASpDesc" runat="server" Height="15px"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
