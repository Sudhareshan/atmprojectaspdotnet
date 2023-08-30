<%@ Page Title="" Language="C#" MasterPageFile="~/Custmoer.Master" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="ATM_Antra.Withdraw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .MainDiv{
            text-align:center;
            color:black;
        }
        .divclass{
            padding-bottom:20px;
            height:35px;
        }
        #ContentPlaceHolder1_txtWithdraw{
            width:200px;
            height:25px;
            border-radius:2px;           
        }
       /* #ContentPlaceHolder1_btnWithd:hover{
            background-color:Highlight;
             width:75px;
             height:35px;
        }*/
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
        function AmountWithdraw(res) {
            alert(res);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainDiv">
        <h1>Withdrawal</h1>
        <div class="container ">
            <div class="left-side-content">
                <asp:Label  runat="server" Text="" ID="lblCustName"></asp:Label>
            </div>
        </div>
        <div>
            <div class="divclass">
                <asp:Label Text="Enter Amount" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div class="auto-style1">
                <asp:TextBox runat="server" ID="txtWithdraw" ></asp:TextBox>
            </div>
            <div class="divclass">
               <asp:Button runat="server" Text="Withdraw"  ID="btnWithd" OnClick="btnWithd_Click" />
            </div>
                     
        </div>
    </div>
</asp:Content>
