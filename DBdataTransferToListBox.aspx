<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DBdataTransferToListBox.aspx.cs" Inherits="DBdataTransferToListBox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:ListBox ID="ListBox1" runat="server" Height="251px" Width="152px"></asp:ListBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="資料庫資料轉至ListBox" />
    
    </div>
    </form>
</body>
</html>
