using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ATM_Antra
{
    public partial class Withdraw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cust_Name = Session["Name"].ToString();
                if (cust_Name != null)
                {
                    lblCustName.Text = "Welcome " + cust_Name + "  ";
                }


            }
        }

        protected void btnWithd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["AccountNum"] != null)
                {
                    long accountNum = long.Parse(Session["AccountNum"].ToString());
                    using (SqlConnection dbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                    {
                        dbconnection.Open();
                        SqlCommand cmd = new SqlCommand("sp_GetBalance", dbconnection);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AccNum", accountNum);
                        double balance = Convert.ToDouble(cmd.ExecuteScalar());
                        double totalDeposit = balance - double.Parse(txtWithdraw.Text);
                        
                        if (totalDeposit <= 2000)
                        {
                            string msg = "Insufficient balance";
                            ClientScript.RegisterStartupScript(this.GetType(), "Withdraw", $"AmountWithdraw('{msg}')", true);

                        }
                        else
                        {
                            SqlCommand cmdWithdraw = new SqlCommand("sp_DepositAmount", dbconnection);
                            cmdWithdraw.CommandType = CommandType.StoredProcedure;
                           
                            //double totalDeposit = balance - double.Parse(txtWithdraw.Text);

                            cmdWithdraw.Parameters.AddWithValue("@dpstBal", totalDeposit);
                            cmdWithdraw.Parameters.AddWithValue("@id", accountNum);
                            int withDraw_Amount = cmdWithdraw.ExecuteNonQuery();
                            if (withDraw_Amount > 1)
                            {
                                string msg = "Withdrawal Money Sucessfully   " + txtWithdraw.Text;
                                ClientScript.RegisterStartupScript(this.GetType(), "deposit", $"AmountWithdraw('{msg}')", true);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
                lblCustName.Text = "Something went Wrong";
                lblCustName.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {

                txtWithdraw.Text = "";
            }
        }
    }
}