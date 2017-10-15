using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class A1_5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PID"] != null)
        {
            if (this.IsPostBack == false)// 利用IsPostBack 第一次進入此頁面，IsPostBack值為false。但在同頁執行時，IsPostBack值會為ture。
            {
                txtName.Text = Session["PName"].ToString();
                txtCode.Text = Session["PCode"].ToString();
                ddlroletype.Text = Session["PRoleType"].ToString();
                txtEmail.Text = Session["PEmail"].ToString();
                txtPassword.Text = Session["PPassword"].ToString();
                DateTime birthday = (DateTime)Session["PBirthDate"];
                ddlEducation.Text = Session["PEducation"].ToString();
                ddlYear.SelectedValue = birthday.Year.ToString();
                ddlMonth.SelectedValue = birthday.Month.ToString();
                ddlDay.SelectedValue = birthday.Day.ToString();

                ddlRegion.Text = Session["PRegion"].ToString();

                ddlPtitle.Text = Session["Ptitle"].ToString();
                ddlPDepartment.Text = Session["PDepartment"].ToString();
                ddlPCollege.Text = Session["PCollege"].ToString();

            }
        }
        else
        {
            Response.Write("<script>alert('登入失敗,前往登入'); location.href='MAIN.aspx'; </script>");
            //Response.Redirect("login.aspx");
            //txtName.Text = "失敗";
        }

    }

    protected void btnInforChange_Click(object sender, EventArgs e)
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
            if (Session["PID"] == null)
            {
                Response.Write("<script>alert('登入失敗，前往登入!'); location.href='MAIN.aspx'; </script>");
            }
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