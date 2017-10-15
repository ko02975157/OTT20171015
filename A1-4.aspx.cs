using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class A1_4 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

    protected void gvVideo_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtMCOrgStatus.Text = "";
        txtRestrictPW.Text = "";
        txtTitle.Text = "";
        rdoPublic.SelectedIndex = -1;

        int mcid = (int)gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCID"];

        string MCTitle = "";
        string MCOrgStatus = "";
        string MCApprovalStatus = "";

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCTitle"] != null)
            MCTitle = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCTitle"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCOrgStatus"] != null)
            MCOrgStatus = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCOrgStatus"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCApprovalStatus"] != null)
            MCApprovalStatus = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCApprovalStatus"].ToString();

        txtTitle.Text = MCTitle;
        txtMCOrgStatus.Text = MCOrgStatus;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int mcid = (int)gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCID"];
        string MCOrgStatus = rdoPublic.SelectedValue;
        if (MCOrgStatus == "")
        {
            Response.Write("<script>alert('請選擇公開方式'); location.href='MAIN1.aspx'; </script>");
            return;
        }

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update MediaUpload Set MCOrgStatus = @MCOrgStatus WHERE mcid = @mcid";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@mcid", mcid);
            cmd.Parameters.AddWithValue("@MCOrgStatus", MCOrgStatus);
            conn.Open();
            cmd.ExecuteNonQuery();
        }
        dsMediaUpload.DataBind();
        gvVideo.DataBind();
    }
}