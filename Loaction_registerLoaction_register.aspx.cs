using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


public partial class test : System.Web.UI.Page
{
    Label[] day = new Label[7];
    CheckBox[,] orders = new CheckBox[7, 14];
    
    protected void Page_Load(object sender, EventArgs e)
    {

        int tmpIdx = 1;
        for (int i=0;i<7;i++)
        {
            Label templbl = (Label)this.FindControl("lbl" + (i+1).ToString());
            day[i] = templbl;
            for (int j = 0; j < 14; j++)
            {
                CheckBox tempchk = (CheckBox)this.FindControl("B" + tmpIdx.ToString());
                orders[i, j] = tempchk;
                tmpIdx++;
            }
        }
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        if (string.IsNullOrEmpty(txtStartDate.Text) )
        {
            lblMessage.Text = "日期不得空白，輸入錯誤請重新輸入!";
            txtStartDate.Focus();
            return;
        }
        if (string.IsNullOrEmpty(txtPlace.Text))
        {
            lblMessage.Text = "場地關鍵字不得空白，輸入錯誤請重新輸入!";
            txtPlace.Focus();
            return;
        }
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationRegister.mdf;Integrated Security=True");
        ObjConn.Open();
        string SqlString;
        if (txtPlace.Text.ToUpper() == "ALL")
        {
            SqlString = "select Lno,LName,LPNo from location";
        }
        else
        {
            SqlString = "select Lno,LName,LPNo from location where  LName like N'%" + txtPlace.Text + "%'";
        }
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        SqlDataReader rs = SqlComm.ExecuteReader();
        if (rs.HasRows == false)
        {
            lblMessage.Text  = "資料檔中查無資料!!";
        }
        gdViewPlace.DataSource = rs;
        gdViewPlace.DataBind();
        ObjConn.Close();
        rs.Close();
    }

    protected void gdViewPlace_SelectedIndexChanged(object sender, EventArgs e)
    {
        int tmpIdx = 1;
        for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 14; j++)
            {
                CheckBox tempchk = (CheckBox)this.FindControl("B" + tmpIdx.ToString());
                tempchk.Enabled = true;
                tempchk.Checked = false;
                tmpIdx++;
            }
        }
        int currentRowIndex = gdViewPlace.SelectedIndex;
        if (currentRowIndex == -1)
            return;
        string txtPNo = gdViewPlace.Rows[currentRowIndex].Cells[1].Text;
        string txtName = gdViewPlace.Rows[currentRowIndex].Cells[2].Text;
        lblLName.Text = txtName;
        lblLNO.Text = txtPNo;
        DateTime startDate = DateTime.Parse(DateTime.Now.Year.ToString() + "/" + txtStartDate.Text.Substring(0,2) + "/" +txtStartDate.Text.Substring(2,2));
        //DateTime endDate = DateTime.Parse(DateTime.Now.Year.ToString() + "/" + txtEndDate.Text.Substring(0,2) + "/" +txtEndDate.Text.Substring(2,2));
        DateTime nextDate = startDate;
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationRegister.mdf;Integrated Security=True");
        ObjConn.Open();
        for (int i = 0; i <7; i++)
        {
            day[i].Text = nextDate.Month.ToString() + "月" + nextDate.Day.ToString() + "日";
            string SqlString = "select RSNo from Register where RDate='" + nextDate.Month.ToString("00") + nextDate.Day.ToString("00") + "' and RLNo='" + txtPNo + "'";
            SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
            SqlDataReader rs = SqlComm.ExecuteReader();
            while (rs.Read() == true)
            {
                int rsno = (int)rs["RSNO"];
                orders[i, rsno - 1].Checked = true;
                orders[i, rsno - 1].Enabled = false;
            }
            rs.Close();
            nextDate = nextDate + TimeSpan.FromDays(1);
        }
        //DateTime endDate = nextDate - TimeSpan.FromDays(1);
     
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        int tmpIdx = 1;
        for (int i = 0; i < 7; i++)
        {
            for (int j = 0; j < 14; j++)
            {
                CheckBox tempchk = (CheckBox)this.FindControl("B" + tmpIdx.ToString());
                orders[i, j] = tempchk;
                tmpIdx++;
            }
        }
        for (int i = 0; i < 7; i++)
        {
            DateTime currentDay = DateTime.Parse(DateTime.Now.Year.ToString() + "年" + day[i].Text);
            string daystr = currentDay.Month.ToString("00") + currentDay.Day.ToString("00");
            for (int j = 0; j < 14; j++)
            {      
                CheckBox tempchk = orders[i, j];
                if (tempchk.Enabled == true && tempchk.Checked == true)
                {
                    SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationRegister.mdf;Integrated Security=True");
                    ObjConn.Open();
                    string SqlString = "INSERT INTO Register (RDate, RLNo, RSNo) VALUES (@RDate, @RLNo, @RSNo)";
                    SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
                    SqlComm.Parameters.AddWithValue("@RDate", daystr);
                    SqlComm.Parameters.AddWithValue("@RLNo", lblLNO.Text);
                    SqlComm.Parameters.AddWithValue("@RSNo", j + 1);
                    int n = SqlComm.ExecuteNonQuery();
                    if (n > 0)
                        lblMessage.Text = "寫入成功";
                }
            }
        }
    }
}