using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class A2_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GvReviewerSet__SelectedIndexChanged(object sender, EventArgs e)
    {
        BtnAdd.Visible = false;
        BtnChange.Visible = true;
        BtnCancal.Visible = true;
        txtName.Text="";
        txtCode.Text="";
        //ddlroletype.SelectedValue="1";
        // ddlEducation.SelectedValue="1";
        txtEmail.Text = "";
        txtPassword.Text="";

      //  ddlYear.SelectedValue="1";
       // ddlMonth.SelectedValue="1";
      //  ddlDay.SelectedValue="1";

      //  ddlRegion.SelectedValue="1";
      //  ddlPtitle.SelectedValue = "1"; 
      //  ddlPDepartment.SelectedValue = "1";
       // ddlPCollege.SelectedValue = "1";
       
        string PName = "";
        string PCode = "";
        string PRoleType = "";
        string PEducation = "";
        string PEmail = "";
        string PPassword = "";

        //string year = ddlYear.SelectedValue;
        //string month = ddlMonth.SelectedValue;
        //string day = ddlDay.SelectedValue;

        string PRegion = "";
        string PTitle = "";
        string PDepartment = "";
        string PCollege = "";
        string PUserName = "";
        //DateTime strbirthday = DateTime.Parse(year + "/" + month + "/" + day);
        DateTime PBirthDate = DateTime.Now;

        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PName"] != null)
            PName = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PName"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PCode"] != null)
            PCode = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PCode"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PRoleType"] != System.DBNull.Value)
            PRoleType = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PRoleType"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PEducation"] != null)
            PEducation = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PEducation"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PEmail"] != null)
            PEmail = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PEmail"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PPassword"] != null)
            PPassword = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PPassword"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PRegion"] != null)
            PRegion = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PRegion"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PTitle"] != System.DBNull.Value)
            PTitle = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PTitle"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PDepartment"] != System.DBNull.Value)
            PDepartment = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PDepartment"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PCollege"] != System.DBNull.Value)
            PCollege = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PCollege"].ToString();
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PBirthDate"] != System.DBNull.Value)
            PBirthDate = (DateTime)gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PBirthDate"];
        if (gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PUserName"] != null)
            PUserName = gvReviewerSet.DataKeys[gvReviewerSet.SelectedIndex].Values["PUserName"].ToString();

        txtName.Text = PName;
        txtCode.Text = PCode;
        txtPassword.Text = PPassword;
        txtEmail.Text = PEmail;
        txtUsername.Text = PUserName;
        ddlPCollege.SelectedValue = PCollege;
        ddlPDepartment.SelectedValue = PDepartment;
        ddlPtitle.SelectedValue = PTitle;
        ddlRegion.SelectedValue = PRegion;
        ddlroletype.SelectedValue = PRoleType;
        ddlEducation.SelectedValue = PEducation;
        string year = PBirthDate.Year.ToString();
        ddlYear.SelectedValue = year;
        string month = PBirthDate.Month.ToString();
        ddlMonth.SelectedValue = month;
        string day = PBirthDate.Day.ToString();
        ddlDay.SelectedValue = day;
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        string code = txtCode.Text;
        string strRoletype = ddlroletype.SelectedValue;
        int roletype = 1;     // 預設角色為學生
        int.TryParse(strRoletype, out roletype);
        DateTime createdtime = DateTime.Now;
        string email = txtEmail.Text;
        string username = txtUsername.Text;
        string password = txtUsername.Text;
        string education = ddlEducation.Text;
        string region = ddlRegion.Text;

        string strtitle = ddlPtitle.SelectedValue;
        int title = 1; //預設職稱為學生
        int.TryParse(strtitle, out title);

        string strdepartment = ddlPDepartment.SelectedValue;
        int department = 1;//預設系為資管系
        int.TryParse(strdepartment, out department);

        string strcollege = ddlPCollege.SelectedValue;
        int college = 1;//預設院為資訊學院
        int.TryParse(strcollege, out college);

        string year = ddlYear.SelectedValue;
        string month = ddlMonth.SelectedValue;
        string day = ddlDay.SelectedValue;
        DateTime birthday = DateTime.Parse(year + "/" + month + "/" + day);


        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Insert Into Person (PName, PCode, PRoleType, PCreatedOn,PEmail,PUserName,PPassword,PBirthDate,PEducation,PRegion,PSuper,PTitle,PDepartment,PCollege) VALUES (@PName, @PCode,@PRoleType,@PCreatedOn,@PEmail,@PUserName,@PPassword,@PBirthDate,@PEducation,@PRegion,1,@PTitle,@PDepartment,@PCollege)";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@PName", name);
            cmd.Parameters.AddWithValue("@PCode", code);
            cmd.Parameters.AddWithValue("@PRoleType", roletype);
            cmd.Parameters.AddWithValue("@PCreatedOn", createdtime);
            cmd.Parameters.AddWithValue("@PEmail", email);
            cmd.Parameters.AddWithValue("@PUserName", username);
            cmd.Parameters.AddWithValue("@PPassword", password);
            cmd.Parameters.AddWithValue("@PBirthDate", birthday);
            cmd.Parameters.AddWithValue("@PEducation", education);
            cmd.Parameters.AddWithValue("@PRegion", region);
            cmd.Parameters.AddWithValue("@PTitle", title);
            cmd.Parameters.AddWithValue("@PDepartment", department);
            cmd.Parameters.AddWithValue("@PCollege", college);
            conn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                Response.Write("<script>alert('新增成功一位審核人員!'); </script>");
            }
        }
    }

    protected void BtnCheck_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))

        {
            string usernamecheck = txtUsername.Text;
            conn.Open();
            string sqlStatement = "Select PUserName From Person Where PUserName= @user ";
            SqlCommand cmd = new SqlCommand(sqlStatement, conn);
            cmd.Parameters.AddWithValue("@user", usernamecheck);
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                if (rd.Read())
                {
                    if (usernamecheck == rd["PUserName"].ToString())
                    {
                        Response.Write("<script>alert('此帳號，有人使用!'); </script>");
                        txtUsername.Text = "";
                    }
                }

            }

            {
                Response.Write("<script>alert('此帳號，無人使用!'); </script>");
                txtUsername.Text = usernamecheck;
            }
        }
    }



    protected void BtnChange_Click(object sender, EventArgs e)
    {
        string strname = txtName.Text;
        string strcode = txtCode.Text;
        string strRoletype = ddlroletype.SelectedValue;
        string strEducation = ddlEducation.SelectedValue;
        string stremail = txtEmail.Text;
        string strpassword = txtPassword.Text;

        string year = ddlYear.SelectedValue;
        string month = ddlMonth.SelectedValue;
        string day = ddlDay.SelectedValue;

        string strregion = ddlRegion.SelectedValue;
        string strtitle = ddlPtitle.SelectedValue;
        string strdepartment = ddlPDepartment.SelectedValue;
        string strcollege = ddlPCollege.SelectedValue;


        DateTime strbirthday = DateTime.Parse(year + "/" + month + "/" + day);


        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
           // if (Session["PID"] == null)
           // {
           //     Response.Write("<script>alert('登入失敗，前往登入!'); location.href='MAIN.aspx'; </script>");
           // }
            string pid = Session["PID"].ToString();  //判斷登入為何者
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update Person set PName=@PName,PCode=@PCode,PRoleType=@PRoleType,PEmail=@PEmail,PPassword=@PPassword,PBirthDate=@PBirthDate,PEducation=@PEducation,PRegion=@PRegion,PTitle=@PTitle,PDepartment=@PDepartment,PCollege=@PCollege Where PID=@PID";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@PName", strname);
            cmd.Parameters.AddWithValue("@PCode", strcode);
            cmd.Parameters.AddWithValue("@PRoleType", strRoletype);
            cmd.Parameters.AddWithValue("@PEmail", stremail);
            cmd.Parameters.AddWithValue("@PPassword", strpassword);
            cmd.Parameters.AddWithValue("@PBirthDate", strbirthday);
            cmd.Parameters.AddWithValue("@PEducation", strEducation);
            cmd.Parameters.AddWithValue("@PRegion", strregion);
            cmd.Parameters.AddWithValue("@PTitle", strtitle);
            cmd.Parameters.AddWithValue("@PDepartment", strdepartment);
            cmd.Parameters.AddWithValue("@PCollege", strcollege);
            cmd.Parameters.AddWithValue("@PID", pid);  //判斷登入者
            conn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                Response.Write("<script>alert('修改成功'); </script>");
                //Response.Write("修改成功");
                //Response.Redirect("Default.aspx");
            }
        }
    }
}