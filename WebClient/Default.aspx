<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebClient._Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowCurrentTime() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/PrintName",
                data: '{name: "' + $("#<%=txtUserName.ClientID%>")[0].value + '",Number:"' + $("#<%=txtNumber.ClientID%>")[0].value + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {
            //alert(JSON.stringify(response.d));
            var res = response.d.split("\r\n");
            $("#<%=lblName.ClientID%>").text(res[0]);
            $("#<%=lblNumber.ClientID%>").text('"' + res[1] + '"');

        }
    </script>
</head>
<body style="font-family: Arial; font-size: 10pt">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name :</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Number :</td>
                    <td>
                        <asp:TextBox ID="txtNumber" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="btnGetTime" type="button" value="Show Output"
                            onclick="ShowCurrentTime()" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;"></td>
                    <td style="text-align: center;"><b>Output :</b>
                        <asp:Label ID="lblName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align: center;"></td>
                    <td>
                        <asp:Label ID="lblNumber" runat="server"></asp:Label></td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>

