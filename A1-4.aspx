<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeFile="A1-4.aspx.cs" Inherits="A1_4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .tableStyle {
            width: 90%;
        }
        .col1Style {
            width: 50%;
        }


        .auto-style2 {
            width: 61%;
        }


        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">   
    <table class="tableStyle" style="background-color: #CCFFCC">
        <tr>
            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="X-Large" ForeColor="#000099" Text="修正公開方式"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Names="標楷體" Font-Size="Medium" ForeColor="Red"></asp:Label>
                <br /></td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                        <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsMediaUpload" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gvVideo_SelectedIndexChanged" AllowPaging="True" DataKeyNames="MCID,MCTitle,MCOrgStatus" Width="490px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
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
                                <asp:BoundField DataField="MCApprovalStatus" HeaderText="審核狀態" SortExpression="MCApprovalStatus">
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
                        <asp:SqlDataSource ID="dsMediaUpload" runat="server" ConnectionString="<%$ ConnectionStrings:OTTConnectionString %>" SelectCommand="SELECT [MCID], [MCTitle], [MCCreatedDate], [MCOrgStatus], [MCApprovalStatus] FROM [MediaUpload] WHERE MCApprovalStatus = '未審核' and ([PID] = @PID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="PID" SessionField="PID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
            </td>
            <td>
                
                    <asp:Label ID="Label1" runat="server" Text="影片名稱" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" Width="250px" Font-Bold="True" ForeColor="#0033CC" ID="txtTitle"></asp:TextBox>
                        &nbsp;
                        <br />
                    <asp:Label ID="Label6" runat="server" Text="原公開方式" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox runat="server" Width="250px" Font-Bold="True" ForeColor="#0033CC" ID="txtMCOrgStatus"></asp:TextBox>
                        <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="修正為" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                        <br />
                    <asp:RadioButtonList ID="rdoPublic" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>校外公開</asp:ListItem>
                        <asp:ListItem>校內公開</asp:ListItem>
                        <asp:ListItem>限閱</asp:ListItem>
                    </asp:RadioButtonList>
                    &nbsp;
                    &nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    <asp:Label ID="Label8" runat="server" Text="限閱密碼" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
                        &nbsp;<br />
                    <asp:TextBox ID="txtRestrictPW" runat="server" Width="246px" Font-Bold="True" ForeColor="#0033CC"></asp:TextBox>
                        <br />
                    <br />
                <asp:Button ID="btnUpdate" runat="server" Height="30px" OnClick="btnUpdate_Click" Text="修改" Width="58px" />
                        <br />
                    <br />
                        <br />
                    <asp:Label ID="Label9" runat="server" ForeColor="#FF3300" Text="請注意：已進行審查之影片不得修正其公開方式"></asp:Label>
                    &nbsp;<br />
                    <asp:Label ID="Label10" runat="server" ForeColor="#FF3300" Text="本功能不顯示已審查完成之影片"></asp:Label>
                    
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
                        <td>&nbsp;</td>
        </tr>
    </table>
 
</asp:Content>

