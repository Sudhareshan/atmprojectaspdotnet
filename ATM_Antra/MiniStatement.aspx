<%@ Page Title="" Language="C#" MasterPageFile="~/Custmoer.Master" AutoEventWireup="true" CodeBehind="MiniStatement.aspx.cs" Inherits="ATM_Antra.MiniStatement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .MainDiv {
            text-align: center;
            color: black;
        }

        .divclass {
            padding-bottom: 20px;
            height: 35px;
        }


        .left-side-content {
            display: flex;
            /*align-items:start;*/
            justify-content: start;
            font-size: 22px;
            color: forestgreen;
        }

        .auto-style1 {
            padding-bottom: 20px;
        }

        .gridDiv {
            display: flex;
            justify-content: center;
            
        }

        #ContentPlaceHolder1_GridMiniStatement {
            border-collapse: collapse;
             width:1200px;
            border-width: medium;

        }
        th{
            height:25px;
            color:white;
            background-color:#0078d7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="MainDiv">
        <h1>Mini Statement</h1>
        <div class="container ">
            <div class="left-side-content">
                <asp:Label runat="server" Text="" ID="lblCustName"></asp:Label>
            </div>
        </div>
        <div class="gridDiv">

            <asp:GridView ID="GridMiniStatement" runat="server">
            </asp:GridView>

        </div>
    </div>
</asp:Content>
