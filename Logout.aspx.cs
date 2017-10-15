using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PID"] == null)
        {
            Response.Redirect("MAIN.aspx");
            Response.Write("未登入");
        }
        else
        {
            Session.Abandon();
            Response.Write("<script>alert('登出成功，前往登入頁面!'); location.href='MAIN.aspx'; </script>");
        }
    }
}