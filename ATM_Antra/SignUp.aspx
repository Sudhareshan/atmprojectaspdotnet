<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ATM_Antra.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <style>
        body {
            background-color: #003366;
        }

        #MainDiv {
             align-items:center;
            display: flex;
            justify-content: center;
            height:500px;
        }

        #Signup {
            align-content: center;
            align-items: center;
            text-align: center;
            background-color: #f1f3f4;
            border-radius:20px;
            width: 30%;
            height:175px;
           

        }

        #lblHeadtext {
            padding: 45px;
        }
        #loginform{
            padding-inline: 20px;

        }
        .row {
            display: flex;
            justify-content: space-between;
            padding-bottom:10px;
        }
        .divReg{
            align-content:center; 
           
        }
        #btnReg:hover{
            background-color:white !important;
            text-align:center;
            color:black !important;
            
        }
    </style>
    <script>
        function Validate() {
            if (document.getElementById("txtCname").value = "") {
                alert("Name Required");
                document.getElementById("txtCname").focus();
                return false;
            }
            if (document.getElementById("txtMobile").value = "") {
                alert("Name Required");
                document.getElementById("txtMobile").focus();
                return false;
            }
            //var re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
            //var PhoneText = document.getElementById("txtMobile").value;
            //var matchdata = PhoneText.match(re);
            //debugger;
            //if (matchdata == null) {
            //    alert("Incorrect Phone No");
            //    document.getElementById("txtMobile").focus();
            //    return false;
            //}
        }
        function ShowPop(res) {
            alert(res);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="MainDiv" class="auto-style1">
            <div id="Signup">
                <asp:Label runat="server" ID="lblHeadtext" Text="Register Your Account" Font-Size="XX-Large" ForeColor="#003366"></asp:Label>
                <hr />
                <div id="loginform">
                    <div class="row">
                        <asp:Label runat="server" ID="lblName" Text="Name"></asp:Label>
                        <asp:TextBox runat="server" ID="txtCname"></asp:TextBox>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" ID="lblMoile" Text="Mobile Number"></asp:Label>
                        <asp:TextBox runat="server" ID="txtMobile" TextMode="Number" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" ID="lblAmount" Text="Minimum Balance"></asp:Label>
                        <asp:TextBox runat="server" ID="txtamount" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="divReg">
                        <asp:Button runat="server" Text="Register" ID="btnReg" ForeColor="White" BackColor="#003366" OnClick="btnReg_Click" OnClientClick="Validate()"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
