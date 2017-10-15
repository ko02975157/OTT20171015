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
        Session["PNo"] = "7465618";
       //將物件的位置存到陣列中
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
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationDB.mdf;Integrated Security=True");
        ObjConn.Open();
        string SqlString;        
        SqlString = "select ASno, ADesc, ADept, APName, ATel, APRes, ACompYN, ASupYN, ACpRes, ASpRes from Activity where  APRes is null or APRes = ''";
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        SqlDataReader rs = SqlComm.ExecuteReader();
        if (rs.HasRows == false)
        {
            lblMessage.Text = "資料檔中查無資料!!";
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
            Label tmptitle = (Label)this.FindControl("lbl" + (i + 1).ToString());
            tmptitle.Text = "";
            for (int j = 0; j < 14; j++)
            {
                CheckBox tempchk = (CheckBox)this.FindControl("B" + tmpIdx.ToString());
                tempchk.Enabled = false;
                tempchk.Checked = false;
                tmpIdx++;
            }
        }
        int currentRowIndex = gdViewPlace.SelectedIndex;
        if (currentRowIndex == -1)
            return;
        string tmpActNo = gdViewPlace.Rows[currentRowIndex].Cells[1].Text;
        txtASno.Text = tmpActNo;        
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationDB.mdf;Integrated Security=True");
        ObjConn.Open();       
        string SqlString = "select DISTINCT RLNo, LName from Register, Location where Register.RLNo = Location.LNo and RASno=" + tmpActNo;
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        SqlDataReader rs = SqlComm.ExecuteReader();
        RBListLocation.Items.Clear();
        while (rs.Read() == true)
        {
            string LNo = rs["RLNo"].ToString();
            string LName = rs["LName"].ToString();
            RBListLocation.Items.Add(new ListItem(LName, LNo));
        }
        
        rs.Close();
    }
        

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationDB.mdf;Integrated Security=True");
        ObjConn.Open();
        if (string.IsNullOrEmpty(RBListAudit.SelectedValue) == true)
        {
            return;
        }
        if (Session["PNo"] == null)
        {
            return;
        }
        string SqlString = "update Activity set APRes=N'" + RBListAudit.SelectedValue + "', ";
        SqlString = SqlString + " APDate='" + DateTime.Now.Year.ToString("0000") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Day.ToString("00") + "', ";
        SqlString = SqlString + "APNo=N'" +Session["PNo"].ToString() + "', ";
        SqlString = SqlString + "APDesc=N'" +txtReson.Text + "' ";      
        SqlString = SqlString + " where ASno=" + txtASno.Text ;
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        int count = SqlComm.ExecuteNonQuery();
        ObjConn.Close();
        if (count == 0)
        {
            lblMessage.Text = "修改失敗,請通知系統管理人員處理";
        }
        else
        {
            SqlConnection ObjConn1 = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationDB.mdf;Integrated Security=True");
            ObjConn1.Open();
            string SqlString1;
            SqlString1 = "select ASno, ADesc, ADept, APName, ATel, APRes, ACompYN, ASupYN, ACpRes, ASpRes from Activity where  APRes is null or APRes = ''";
            SqlCommand SqlComm1 = new SqlCommand(SqlString1, ObjConn1);
            SqlDataReader rs = SqlComm1.ExecuteReader();
            if (rs.HasRows == false)
            {
                lblMessage.Text = "資料檔中查無資料!!";
            }
            gdViewPlace.DataSource = rs;
            gdViewPlace.DataBind();
            ObjConn1.Close();
            rs.Close();

            int tmpIdx = 1;
            for (int i = 0; i < 7; i++)
            {
                Label tmptitle = (Label)this.FindControl("lbl" + (i + 1).ToString());
                tmptitle.Text = "";
                for (int j = 0; j < 14; j++)
                {
                    CheckBox tempchk = (CheckBox)this.FindControl("B" + tmpIdx.ToString());
                    tempchk.Enabled = true;
                    tempchk.Checked = false;
                    tmpIdx++;
                }
            }
            txtASno.Text="";
            txtADesc.Text="";
            txtADept.Text="";
            txtAPName.Text="";
            txtATel.Text="";
            txtACompYN.Text="";
            txtACompDesc.Text="";
            txtASupYN.Text="";
            txtASupDesc.Text="";
            txtApNo.Text="";
            txtApDate.Text = "";
            txtApRes.Text = "";
            txtApDesc.Text = "";
            txtACpNo.Text = "";
            txtACpDate.Text = "";
            txtACpRes.Text = "";
            txtACpDesc.Text = "";
            txtASpNo.Text = "";
            txtASpDate.Text = "";
            txtASpRes.Text = "";
            txtASpDesc.Text = ""; 
        }
    }
    protected void RBListLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        int currentRowIndex = gdViewPlace.SelectedIndex;
        if (currentRowIndex == -1)
            return;
        string tmpActNo = gdViewPlace.Rows[currentRowIndex].Cells[1].Text;
        txtASno.Text = tmpActNo;
        string LNo = RBListLocation.SelectedValue;
        int tmpIdx = 1;
        for (int i = 0; i < 7; i++)
        {
            Label tmptitle = (Label)this.FindControl("lbl" + (i + 1).ToString());
            tmptitle.Text = "";
            for (int j = 0; j < 14; j++)
            {
                CheckBox tempchk = (CheckBox)this.FindControl("B" + tmpIdx.ToString());
                tempchk.Enabled = true;
                tempchk.Checked = false;
                tmpIdx++;
            }
        }
        SqlConnection ObjConn = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=d:\D-1上課資料\web程式設計\employee\App_Data\LocationDB.mdf;Integrated Security=True");
        ObjConn.Open();

        string SqlString = "select RDate, RSNo from Register WHERE RLNo = @LNo and RASno=@RASno order by RDate, RLNo, RSNo";
        SqlCommand SqlComm = new SqlCommand(SqlString, ObjConn);
        SqlComm.Parameters.AddWithValue("@LNo", LNo);
        SqlComm.Parameters.AddWithValue("@RASno", tmpActNo);
        SqlDataReader rs = SqlComm.ExecuteReader();
        string currentdate = "";
        int k = -1;
        while (rs.Read() == true)
        {
            string rdate = (string)rs["RDate"];
            int rsno = (int)rs["RSNO"];
            if (currentdate != rdate)
            {
                k++;
                currentdate = rdate;
                Label title = (Label)this.FindControl("lbl" + (k + 1).ToString());
                title.Text = currentdate.Substring(0,2).ToString() + "月" + currentdate.Substring(2,2).ToString() + "日";
            }
            orders[k, rsno - 1].Checked = true;
            orders[k, rsno - 1].Enabled = false;
        }
        rs.Close();

        string SqlString1;
        SqlString1 = "select * from Activity where ASno='" + txtASno.Text + "'";
        SqlCommand SqlComm1 = new SqlCommand(SqlString1, ObjConn);
        SqlDataReader rs1 = SqlComm1.ExecuteReader();
        if (rs1.Read() == true)
        {
            txtASno.Text = rs1["ASno"].ToString();
            txtADesc.Text = rs1["ADesc"].ToString();
            txtADept.Text = rs1["ADept"].ToString();
            txtAPName.Text = rs1["APName"].ToString();
            txtATel.Text = rs1["ATel"].ToString();
            txtACompYN.Text = rs1["ACompYN"].ToString();
            txtACompDesc.Text = rs1["ACompDesc"].ToString();
            txtASupYN.Text = rs1["ASupYN"].ToString();
            txtASupDesc.Text = rs1["ASupDesc"].ToString();
            txtApNo.Text = rs1["ApNo"].ToString();
            txtApDate.Text = rs1["ApDate"].ToString();
            txtApRes.Text = rs1["ApRes"].ToString();
            txtApDesc.Text = rs1["ApDesc"].ToString();
            txtACpNo.Text = rs1["ACpNo"].ToString();
            txtACpDate.Text = rs1["ACpDate"].ToString();
            txtACpRes.Text = rs1["ACpRes"].ToString();
            txtACpDesc.Text = rs1["ACpDesc"].ToString();
            txtASpNo.Text = rs1["ASpNo"].ToString();
            txtASpDate.Text = rs1["ASpDate"].ToString();
            txtASpRes.Text = rs1["ASpRes"].ToString();
            txtASpDesc.Text = rs1["ASpDesc"].ToString();
            rs1.Close();

            txtASno.Enabled = false;
            txtADesc.Enabled = false;
            txtADept.Enabled = false;
            txtAPName.Enabled = false;
            txtATel.Enabled = false;
            txtACompYN.Enabled = false;
            txtACompDesc.Enabled = false;
            txtASupYN.Enabled = false;
            txtASupDesc.Enabled = false;
            txtApNo.Enabled = false;
            txtApDate.Enabled = false;
            txtApRes.Enabled = false;
            txtApDesc.Enabled = false;
            txtACpNo.Enabled = false;
            txtACpDate.Enabled = false;
            txtACpRes.Enabled = false;
            txtACpDesc.Enabled = false;
            txtASpNo.Enabled = false;
            txtASpDate.Enabled = false;
            txtASpRes.Enabled = false;
            txtASpDesc.Enabled = false;
        }
    }
}
