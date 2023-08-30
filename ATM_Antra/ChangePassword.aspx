<%@ Page Title="" Language="C#" MasterPageFile="~/Custmoer.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ATM_Antra.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .MainDiv{
            text-align:center;
            color:black;
        }
        .divclass{
            padding-bottom:1px;
            height:35px;
        }
        #ContentPlaceHolder1_txtWithdraw{
            width:200px;
            height:25px;
            border-radius:2px;           
        }
        #ContentPlaceHolder1_btnWithd:hover{
            background-color:Highlight;
             width:80px;
             height:35px;
        }
        #ContentPlaceHolder1_btnWithd{
            border-radius:3px;
            
        }
        .left-side-content{
            display:flex;
            /*align-items:start;*/
            justify-content:start;
            font-size:22px;
            color:forestgreen;
        }
       
         .auto-style1 {
             padding-bottom: 20px;
         }
       
    </style>
    <script>
        function validate() {
            debugger;
            var newpwd = document.getElementById("ContentPlaceHolder1_txtNewPwd").value;
            var rePwd = document.getElementById("ContentPlaceHolder1_txtRePwd").value;
            var oldPwd = document.getElementById("ContentPlaceHolder1_txtOldPwd").value;
            if (newpwd !== rePwd) {
                alert("Miss Match");
                return false;
            }
            if (!newpwd || !rePwd || !oldPwd) {
                alert("Empty");
                return false;
            }

           
        }

       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="MainDiv">
        <h1>Change Password</h1>
        <div class="container ">
            <div class="left-side-content">
                <asp:Label  runat="server" Text="" ID="lblCustName"></asp:Label>
            </div>
        </div>
        <div>
            <div class="divclass">
                <asp:Label Text="Enter Old Password" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div class="auto-style1">
                <asp:TextBox runat="server" ID="txtOldPwd" ></asp:TextBox>
            </div>

            <div class="divclass">
                <asp:Label Text="Enter New Password" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div class="auto-style1">
                <asp:TextBox runat="server" ID="txtNewPwd" ></asp:TextBox>
            </div>

            <div class="divclass">
                <asp:Label Text=" Re-Enter Password" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div class="auto-style1">
                <asp:TextBox runat="server" ID="txtRePwd" ></asp:TextBox>
            </div>

            <div class="divclass">
               <asp:Button runat="server" Text="Change Password"  ID="btnWithd" OnClick="btnWithd_Click" OnClientClick="validate()" />
            </div>
                     
        </div>
    </div>
</asp:Content>
