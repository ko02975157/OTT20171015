using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class DBdataTransferToListBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\employeeDB.mdf;Integrated Security=True");
        ObjConn.Open();
        string SqlString = "select empName from employee";
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        SqlDataReader rs = SqlComm.ExecuteReader();
        while (rs.Read())   
        {
            ListBox1.Items.Add(rs["empName"].ToString());
        }
    }
}