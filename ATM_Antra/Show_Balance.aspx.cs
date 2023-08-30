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
    public partial class Show_Balance : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cust_Name = Session["Name"].ToString();
                if (cust_Name != null)
                {
                    lblCustName.Text = "Welcome " + cust_Name + "  ";
                }
                if (Session["AccountNum"] != null)
                {                   
                    try
                    {
                        long accountNum = long.Parse(Session["AccountNum"].ToString());
                        con.Open();
                        SqlCommand cmd = new SqlCommand("sp_GetBalance", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@AccNum", accountNum);
                        double balance = Convert.ToDouble(cmd.ExecuteScalar());
                        lblAvailable.Text = balance.ToString();
                        lblAvailable.ForeColor = System.Drawing.Color.Red;
                        double eff_bal = balance - 2000;
                        lblEff_Bal.Text = eff_bal.ToString();
                        lblEff_Bal.ForeColor = System.Drawing.Color.Red;
                    }
                    catch (SqlException ex)
                    {
                        Response.Write(ex.Message);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                  
            }
            
        }
    }
}