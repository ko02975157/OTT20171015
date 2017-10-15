using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class MAIN : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string UserName = txtUsername.Text;
        string Password = txtPassword.Text;
        int pId = 0;
        int pSuper = 1;
        int pRoleType = 0;
        string pName = "";
        string pCode = "";
        string pEmail = "";
        string pPassword = "";
        string pEducation = "";
        string pRegion = "";
        //string pTitle = "";
        //string pDepartment = "";
        // string pCollege = "";
        string pCollegeName = "";
        string pDepartmentName = "";
        string pTitleName = "";
        int pTitle = 1;
        int pDepartment = 1;
        int pCollege = 1;
        try
        {
            using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
            {
                conn.Open();
                string sqlStatement = "SELECT Person.PTitle, Person.PID, Person.PName, Person.PCode, Person.PRoleType, Person.PCreatedOn, Person.PEmail, Person.PUserName, Person.PPassword, Person.PBirthDate, Person.PEducation, Person.PRegion, Person.PSuper, PTitle.PTitleName, Person.PDepartment, PDepartment.PDepartmentName, Person.PCollege, PCollege.PCollegeName FROM PDepartment INNER JOIN PCollege INNER JOIN PTitle INNER JOIN Person ON PTitle.PTitleNumber = Person.PTitle ON PCollege.PCollegeNumber = Person.PCollege ON PDepartment.PDepartmentNumber = Person.PDepartment Where PUserName= @user AND PPassword= @password";
                SqlCommand cmd = new SqlCommand(sqlStatement, conn);
                cmd.Parameters.AddWithValue("@user", UserName);
                cmd.Parameters.AddWithValue("@password", Password);
                using (SqlDataReader rd = cmd.ExecuteReader())
                {
                    if (rd.Read())
                    {
                        pId = (int)rd["PID"];

                        string strPRoleType = rd["PRoleType"].ToString();
                        if (int.TryParse(strPRoleType, out pRoleType) == false)
                        {
                            //this.lblshow.Text = "登入成功，但資料有錯誤! pRoleType的值為" + strPRoleType;
                            return;
                        }

                        string strPSuper = rd["PSuper"].ToString();
                        if (int.TryParse(strPSuper, out pSuper) == false)
                        {
                            //this.lblshow.Text = "登入成功，但資料有錯誤! pSuper的值為" + strPSuper;
                            return;
                        }
                        pCode = rd["PCode"].ToString();
                        pName = rd["PName"].ToString();
                        pEmail = rd["PEmail"].ToString();
                        pPassword = rd["PPassword"].ToString();
                        string strPBirthDate = rd["PBirthDate"].ToString();
                        DateTime birthday = DateTime.Parse(strPBirthDate);
                        pEducation = rd["PEducation"].ToString();
                        pRegion = rd["PRegion"].ToString();

                        pCollegeName = rd["PCollegeName"].ToString(); ;
                        pDepartmentName = rd["PDepartmentName"].ToString(); ;
                        pTitleName = rd["PTitleName"].ToString(); ;

                        string strpTitle = rd["PTitle"].ToString();
                        if (int.TryParse(strpTitle, out pTitle) == false)
                        {
                            Response.Write("<script>alert('PTitle!有問題') </script>");
                            return;
                        }
                        string strpDepartment = rd["PDepartment"].ToString();
                        if (int.TryParse(strpDepartment, out pDepartment) == false)
                        {
                            Response.Write("<script>alert('PDepartment!有問題') </script>");
                            return;
                        }

                        string strpCollege = rd["PCollege"].ToString();
                        if (int.TryParse(strpCollege, out pCollege) == false)
                        {
                            Response.Write("<script>alert('PCollege!有問題') </script>");
                            return;
                        }

                        Session["PID"] = pId;
                        Session["PRoleType"] = pRoleType;
                        Session["PSuper"] = pSuper;
                        Session["PCode"] = pCode;
                        Session["PName"] = pName;
                        Session["PEmail"] = pEmail;
                        Session["PPassword"] = pPassword;
                        Session["PEducation"] = pEducation;
                        Session["PRegion"] = pRegion;
                        Session["PBirthDate"] = birthday;
                        Session["PTitle"] = pTitle;
                        Session["PDepartment"] = pDepartment;
                        Session["PCollege"] = pCollege;
                        Session["PCollegeName"] = pCollegeName;
                        Session["PDepartmentName"] = pDepartmentName;
                        Session["PTitleName"] = pTitleName;

                        // Response.Write("<script>alert('登入成功!'); location.href='Default.aspx'; </script>");
                        //Response.Redirect("Default.aspx");   //可以session
                        if (pSuper == 0)
                          {
                           Response.Write("<script>alert('登入成功!前往系統管理者頁面'); location.href='MAIN2.aspx'; </script>");
                          }
                        else if (pSuper == 1)
                          {
                            Response.Write("<script>alert('登入成功!前往一般使用者者頁面'); location.href='MAIN1.aspx'; </script>");
                          }
                        else if (pSuper==2 && pTitle==2) //前往審核頁面，職稱為老師
                          {
                            Response.Write("<script>alert('登入成功!前往審核者頁面-老師'); location.href='MAIN3.aspx'; </script>");
                          }
                        else if (pSuper == 2 && pTitle == 3)//前往審核頁面，職稱為系主任
                          {
                            Response.Write("<script>alert('登入成功!前往審核者頁面-系主任'); location.href='MAIN4.aspx'; </script>");
                          }
                         else if (pSuper == 2 && pTitle == 4)//前往審核頁面，職稱為系院長
                          {
                            Response.Write("<script>alert('登入成功!前往審核者頁面-系院長'); location.href='MAIN5.aspx'; </script>");
                          }
                    }
                    else
                    {
                        Response.Write("<script>alert('登入失敗!'); location.href='MAIN.aspx'; </script>");

                        //this.lblshow.Text = "登入失敗";
                    }
                }

            }

        }
        catch (Exception)
        {
            //this.lblshow.Text = "資料連線錯誤";
        }
    }

    
    protected void BtnRegistration_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('前往註冊!'); location.href='registration.aspx'; </script>");
    }
}
