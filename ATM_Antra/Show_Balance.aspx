<%@ Page Title="" Language="C#" MasterPageFile="~/Custmoer.Master" AutoEventWireup="true" CodeBehind="Show_Balance.aspx.cs" Inherits="ATM_Antra.Show_Balance" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="MainDiv">
        <h1>Balance</h1>
        <div class="container ">
            <div class="left-side-content">
                <asp:Label  runat="server" Text="" ID="lblCustName"></asp:Label>
            </div>
        </div>
        <div>
            <div class="divclass">
                <asp:Label Text="Available balance " runat="server" Font-Size="Large"></asp:Label><br />
               <asp:Label  ID="lblAvailable" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div class="auto-style1">
                 <asp:Label Text="Effective available balance" runat="server" Font-Size="Large"></asp:Label><br />
                <asp:Label  ID="lblEff_Bal" runat="server" Font-Size="Large"></asp:Label>
            </div>
           <%-- <div class="divclass">
                 <asp:Label Text="Effective available balance" runat="server" Font-Size="Large"></asp:Label>
               <asp:Button runat="server" Text="Withdraw"  ID="btnWithd" OnClick="btnWithd_Click" />
            </div>--%>
                     
        </div>
    </div>
</asp:Content>
