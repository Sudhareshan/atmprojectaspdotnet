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
    public partial class ChangePassword : System.Web.UI.Page
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
            }
        }

        protected void btnWithd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["AccountNum"] != null)
                {
                    long accountNum = long.Parse(Session["AccountNum"].ToString());
                    con.Open();

                    SqlCommand cmdPin = new SqlCommand("sp_GetPin", con);
                    cmdPin.CommandType = CommandType.StoredProcedure;
                    cmdPin.Parameters.AddWithValue("@id", accountNum);
                    int pinNum = Convert.ToInt32(cmdPin.ExecuteScalar());





                    SqlCommand cmd = new SqlCommand("sp_changePwd", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    int old_pwd = int.Parse(txtOldPwd.Text);
                    int new_pwd = int.Parse(txtNewPwd.Text);
                    int re_Pwd = int.Parse(txtRePwd.Text);

                    if (pinNum == old_pwd)
                    {
                        if (new_pwd == re_Pwd)
                        {
                            cmd.Parameters.AddWithValue("@pwd", txtNewPwd.Text);
                            cmd.Parameters.AddWithValue("@id", accountNum);
                            int update_Pwd = cmd.ExecuteNonQuery();

                            string msg = "Pin Changed Successfully";
                            lblCustName.Text = msg;
                        }
                        else
                        {
                            lblCustName.Text = "Please Check Password";
                            lblCustName.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblCustName.Text = "Invalied Pin Number";
                        lblCustName.ForeColor = System.Drawing.Color.Red;
                    }
                       
                    
                  

                }
            }
            catch(SqlException ex)
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