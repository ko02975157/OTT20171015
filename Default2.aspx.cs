using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
  
     protected void btnDelete_Click(object sender, EventArgs e)
    {
        SqlConnection  ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\employeeDB.mdf;Integrated Security=True");
        ObjConn.Open();       
        string  SqlString = "delete from employee where empNo='" + txtNo.Text + "'";
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        int count = SqlComm.ExecuteNonQuery();
        ObjConn.Close();
        if (count == 0)
        {
            lblMessage.Text = "刪除失敗!!請通知系統管理人員處理";
        }
        else
        {
            lblMessage.Text = "刪除完成!!";
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\employeeDB.mdf;Integrated Security=True");
        ObjConn.Open();
        string SqlString = "Insert into employee(empNo, empName,  empID, empAddress, empTelNo, empSalary) values ('" + txtNo.Text + "','" + txtName.Text + "','" + txtID.Text + "','" + txtAddress + "'," + txtTelNo +"'," + txtSalary.Text + ")";
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        int count = SqlComm.ExecuteNonQuery();
        ObjConn.Close();
        if (count == 0)
            {
                lblMessage.Text = "新增失敗!!請洽程式管理人員";
            }
            else
            {
                lblMessage.Text = "新增成功!!";     
            }
        }
   

    protected void BtnClear_Click(object sender, EventArgs e)
    {
        txtNo.Text = "";
        txtName.Text = "";
        txtID.Text = "";
        txtAddress.Text = "";
        txtTelNo.Text = "";
        txtSalary.Text = "";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
          SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\employeeDB.mdf;Integrated Security=True");
          ObjConn.Open();
          string SqlString = "update employee set empName='" + txtName.Text + "', ";
          SqlString = SqlString + " empTelNo='" + txtID.Text + "', ";
          SqlString = SqlString + "empAddress='" + txtAddress.Text + "', ";
          SqlString = SqlString + "empTelNo='" + txtTelNo.Text + "', ";
          SqlString = SqlString + " empSalary=" + txtSalary.Text;
          SqlString = SqlString + " where empNo='" + txtNo.Text + "'";
          SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
          int count = SqlComm.ExecuteNonQuery();
          ObjConn.Close();
          if ( count == 0)
          {
              lblMessage.Text = "修改失敗,請通知系統管理人員處理";
          }
          else
          {
                lblMessage.Text = "修改完成!!";         
          }       
    }



    protected void btnQuery_Click(object sender, EventArgs e)
    {
          SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\employeeDB.mdf;Integrated Security=True");
         ObjConn.Open();
          // txtNo.Text=Case(Left(txtNo.Text, 1)) & Mid(txtNo.Text, 2, Len(txtNo.Text));        
         string  SqlString = "select * from employee where empNo='" + txtNo.Text + "'";
         SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
         SqlDataReader rs = SqlComm.ExecuteReader();
         ObjConn.Close();
          if (rs.Read() == true)
          {
            txtNo.Text =rs["empNo"].ToString();
            txtName.Text = rs["empName"].ToString();
            txtTelNo.Text = rs["empTelNo"].ToString();
            txtAddress.Text = rs["empAddress"].ToString();
            txtTelNo.Text=rs["empTelNo"].ToString();
            txtSalary.Text= rs["empSalary"].ToString();
            btnUpdate.Focus();
                }
          else
          {
              lblMessage.Text = "查無該筆資料!!";         
          }
    }

    }

  


 
   
  