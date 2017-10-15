using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (this.IsPostBack == false)
        {

        }
        else
        {

        }
    }

    protected void BtnClear_Click(object sender, EventArgs e)
    {
        txtName.Text = "";
        txtCode.Text = "";
        ddlroletype.Text = "";
        txtEmail.Text = "";
        txtUsername.Text = "";
        txtUsername.Text = "";
       // ddlYear.Text = "";
       // ddlMonth.Text = "";
        //ddlDay.Text = "";
       // ddlEducation.Text = "";
       // ddlRegion.Text = "";
       // ddlPtitle.Text = "";
       // ddlPDepartment.Text = "";
       // ddlPCollege.Text = "";
    }
    protected void BtnRegistration_Click1(object sender, EventArgs e)
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
                Response.Write("<script>alert('註冊成功，前往登入頁面進行會員登入!'); location.href='MAIN.aspx'; </script>");
                //Response.Redirect("Default.aspx");
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
}

    

