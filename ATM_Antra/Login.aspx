<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ATM_Antra.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bank</title>
    <style>
        #image {
            width: 80%;
            margin-top: 0px;
        }

        #btnLogin {
            width:300px;
            padding: 5px;
            align-self: auto;
            color: white;
            background-color: dodgerblue;
            border-radius:3px;
        }
        #txtPwd,#txtUname{
            border-radius:5px;
            width:290px;
            height:23px;
        }
    </style>
     <script language="javascript" type="text/javascript">
         function Validate() {
             if (document.getElementById("txtUname").value == "") {
                 alert("Id Required");
                 document.getElementById("txtUname").focus();
                 return false;
             }
             if (document.getElementById("txtPwd").value == "") {
                 alert("Password Required ");
                 document.getElementById("txtPwd").focus();
                 return false;
             }
         }
         function LoginFails(res) {
             alert(res);
         }
     </script>

</head>
<body>
    <form id="form1" runat="server">


        <table class="auto-style1">
            <tr>
                <td>
                    <img src="Images/Login2.PNG" id="image" height="600" width="650" />
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <strong>
                                    <asp:Label class="Uname" ID="lblUname" runat="server" Text="Enter UserId"></asp:Label>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtUname"></asp:TextBox><br />
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    <asp:Label runat="server" ID="lblPwd" Text="Password"></asp:Label></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox runat="server" ID="txtPwd"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click"  OnClientClick="return  Validate()" />
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <hr />
                            </td>
                        </tr>
                        <tr>
                           <td>
                               <asp:Label runat="server" Text="Don't have an account?"></asp:Label>
                               <asp:HyperLink runat="server" ID="hypMain" NavigateUrl="SignUp.aspx" Text="SignUp"></asp:HyperLink>
                           </td>
                        </tr>
                    </table>
                </td>

            </tr>
        </table>
    </form>
</body>
</html>
