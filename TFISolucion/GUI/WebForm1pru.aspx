<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1pru.aspx.cs" Inherits="TFI.GUI.WebForm1pru" %>

<%@ Register assembly="ServerControl1" namespace="ServerControl1" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
        <cc1:WebCustomControl1 ID="WebCustomControl11" runat="server" OnTextChanged="WebCustomControl11_TextChanged">hhh</cc1:WebCustomControl1>
    </form>
</body>
</html>
