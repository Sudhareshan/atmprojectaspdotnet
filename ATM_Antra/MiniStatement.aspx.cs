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
    public partial class MiniStatement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                        long accountNum = long.Parse(Session["AccountNum"].ToString());
                        using (SqlConnection dbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ToString()))
                        {
                            dbconnection.Open();
                            SqlCommand cmd = new SqlCommand("sp_GetMini", dbconnection);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@AcNo", accountNum);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            GridMiniStatement.DataSource = dt;
                            GridMiniStatement.DataBind();
                           
                        }
                    }
                }
            }
            catch(SqlException ex)
            {
                Response.Write(ex.Message);
                lblCustName.Text = "Something went Wrong..Please consult Manager";
                lblCustName.ForeColor = System.Drawing.Color.Red;
            }
           
        }

       
    }
}