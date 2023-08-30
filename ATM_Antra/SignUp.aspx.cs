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
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
                txtamount.Text ="2000";
           // }
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            string name = txtCname.Text;
            string mobile = txtMobile.Text;
            Response.Write(name);
            Response.Write(mobile);
            try
            {
                con.Open();
                    SqlCommand cmd = new SqlCommand("sp_CustInsert", con);
                
                    cmd.CommandType = CommandType.StoredProcedure;
                    int min = 1000;
                    int max = 9999;
                    Random rdm = new Random();
                    int pin = rdm.Next(min, max);
                    SqlParameter outParm = new SqlParameter("@getid", SqlDbType.BigInt)
                    {
                        Direction = ParameterDirection.Output
                    };
                    // if(txtCname.Text.Length>0 && txtMobile.Text.Length>0)
                    //{
                        cmd.Parameters.AddWithValue("@CustomerName", txtCname.Text);
                        cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                        cmd.Parameters.AddWithValue("@PinNum", pin);
                        cmd.Parameters.Add(outParm);
                        int cust_status = cmd.ExecuteNonQuery();
                       // con.Close();
                        String result = (outParm.Value.ToString());
                        if (cust_status == 1)
                        {
                            try
                            {
                                 
                                SqlCommand Fetch = new SqlCommand("sp_Uid_pwd", con);
                                Fetch.CommandType = CommandType.StoredProcedure;
                                Fetch.Parameters.AddWithValue("@id", long.Parse(result));
                                SqlDataReader dr = Fetch.ExecuteReader();
                                if (dr.HasRows)
                                {
                                    while (dr.Read())
                                    {
                                        long AccountNum = (long)dr["AccountNumber"];
                                        int pinNum = (int)dr["PinNum"];

                                        string msg = "Your Account Number  :" + "" + AccountNum + " " + "Your pin Number is  :" + pinNum;
                                        ClientScript.RegisterStartupScript(this.GetType(), "PinNum", $"ShowPop('{msg}')", true);
                                    }
                                }

                            }
                            catch (SqlException ex)
                            {
                                Response.Write(ex.Message);
                            }

                        
                    //}
                       
                    
                    //else
                    //{
                    //    string msg = " Required Name and Mobile Number  ";
                    //    ClientScript.RegisterStartupScript(this.GetType(), "deposit", $"ShowPop('{msg}')", true);
                    //}

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