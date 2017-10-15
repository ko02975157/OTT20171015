<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gridview_test.aspx.cs" Inherits="gridview_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" EmptyDataText="沒有資料錄可顯示。" GridLines="Horizontal" PageSize="5">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:ButtonField HeaderText="button" Text="按鈕" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="empNo" HeaderText="empNo" SortExpression="empNo" />
                <asp:BoundField DataField="empSalary" HeaderText="empSalary" SortExpression="empSalary" />
                <asp:BoundField DataField="empName" HeaderText="empName" SortExpression="empName" />
                <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
                <asp:BoundField DataField="empAddress" HeaderText="empAddress" SortExpression="empAddress" />
                <asp:BoundField DataField="empTelNo" HeaderText="empTelNo" SortExpression="empTelNo" />
                <asp:HyperLinkField HeaderText="hyperlink" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:employeeDBConnectionString1 %>" SelectCommand="SELECT [empNo], [empSalary], [empName], [empID], [empAddress], [empTelNo] FROM [employee]"></asp:SqlDataSource>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
