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
{ //7569906113
    public partial class Deposit : System.Web.UI.Page
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

        protected void btnDep_Click(object sender, EventArgs e)
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

                        SqlCommand depositCmd = new SqlCommand("sp_DepositAmount", dbconnection);
                        //dbconnection.Open();
                        depositCmd.CommandType = CommandType.StoredProcedure;
                        double totalDeposit = balance + double.Parse(txtDeposit.Text);
                        depositCmd.Parameters.AddWithValue("@dpstBal", totalDeposit);
                        depositCmd.Parameters.AddWithValue("@id", accountNum);
                        int update_Amount = depositCmd.ExecuteNonQuery();
                        if (update_Amount > 1)
                        {
                            string msg = "Deposit Money Sucessfully   " + txtDeposit.Text;
                            ClientScript.RegisterStartupScript(this.GetType(), "deposit", $"AmountDepoit('{msg}')", true);
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

                txtDeposit.Text = "";
            }
        }
    }
}