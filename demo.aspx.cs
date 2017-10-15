using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\employee1\App_Data\employee.mdf;Integrated Security=True;Connect Timeout=30");
        ObjConn.Open();
        string SqlString = "Insert into employeeTB(empNo, empName,  empID, empAddress, empTelNo, empSalary) values ('" + txtNo.Text + "',N'" + txtName.Text + "','" + txtID.Text + "',N'" + txtAddress.Text + "','" + txtTelNo.Text + "','" + txtSalary.Text + "')";
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        SqlComm.ExecuteNonQuery();
        ObjConn.Close();
        lblMessage.Text = "新增成功!!";
    }
}