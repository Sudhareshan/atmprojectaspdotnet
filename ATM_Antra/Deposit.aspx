<%@ Page Title="" Language="C#" MasterPageFile="~/Custmoer.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="ATM_Antra.Deposit" %>
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
        #ContentPlaceHolder1_txtDeposit{
            width:200px;
            height:25px;
            border-radius:2px;           
        }
        #ContentPlaceHolder1_btnDep:hover{
            background-color:Highlight;
             width:75px;
             height:35px;
        }
        #ContentPlaceHolder1_btnDep{
            border-radius:3px;
            
        }
        .left-side-content{
            display:flex;
            /*align-items:start;*/
            justify-content:start;
            font-size:22px;
            color:forestgreen;
        }
       
    </style>
     <script>
        function AmountDepoit(res) {
            alert(res);
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainDiv">
        <h1>Deposits</h1>
        <div class="container ">
            <div class="left-side-content">
                <asp:Label  runat="server" Text="" ID="lblCustName"></asp:Label>
            </div>
        </div>
        <div>
            <div class="divclass">
                <asp:Label Text="Enter Amount" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div class="divclass">
                <asp:TextBox runat="server" ID="txtDeposit" ></asp:TextBox>
            </div>
            <div class="divclass">
               <asp:Button runat="server" Text="Deposit"  ID="btnDep" OnClick="btnDep_Click"/>
            </div>
                     
        </div>
    </div>
    
</asp:Content>
