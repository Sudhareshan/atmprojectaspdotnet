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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Login_Credentials", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustomerName", txtUname.Text);
                cmd.Parameters.AddWithValue("@pinNum", txtPwd.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["Name"] = dr["CustomerName"].ToString();
                        Session["AccountNum"] = dr["AccountNumber"].ToString();
                        Response.Redirect("Deposit.aspx");
                    }
                }
                else
                {
                    string msg = "Invalied  Credentials ";
                    ClientScript.RegisterStartupScript(this.GetType(), "deposit", $"LoginFails('{msg}')",true);
                }

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