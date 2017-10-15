using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class A5_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void ConfigureMediaPlayer(MediaPlayerFile file)
    {
        RadMediaPlayer1.Sources.Clear();
        RadMediaPlayer1.StartTime = 0;
        RadMediaPlayer1.Muted = false;
        RadMediaPlayer1.AutoPlay = false;

        foreach (MediaPlayerSource source in file.Sources)
        {
            RadMediaPlayer1.Sources.Add(source);
            source.Path = source.Path;
            source.MimeType = source.MimeType;

            MediaPlayerSource hdSource = new MediaPlayerSource();
            RadMediaPlayer1.Sources.Add(hdSource);
            hdSource.MimeType = source.MimeType;
            hdSource.Path = source.Path;
            hdSource.IsHD = true;
        }
    }
    protected void gvVideo_SelectedIndexChanged(object sender, EventArgs e)
    {
        // 其他審核者意見
        lbl1stComment.Text = "";
        lbl2stComment.Text = "";
        lbl3stComment.Text = "";
        lblDeptComment.Text = "";
        lblOpen1.Text = "";
        lblOpen2.Text = "";
        lblOpen3.Text = "";
        lblOpenDept.Text = "";
        lblPass1.Text = "";
        lblPass2.Text = "";
        lblPass3.Text = "";
        lblPassDept.Text = "";

        // 上傳影片屬性
        lbldreceiveTime.Text = "";
        lblmcid.Text = "";
        lblPName.Text = "";
        lblTitle.Text = "";
        txtmreview.Text = "";
        ddlmresult.SelectedValue = "-1";

        int mcid = (int)gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCID"];
        string dreview = "";
        int dresult = -1;
        string DMCOrgStatus = "";
        string mreview = "";
        int mresult = -1;
        string MMCOrgStatus = "";
        string MCYouTubeURL = "";
        string MCTitle = "";
        DateTime MCCreatedDate = DateTime.Now;
        string MCOrgStatus = "";
        string PName = "";

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["PName"] != null)
            PName = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["PName"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["dreview"] != null)
            dreview = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["dreview"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["dresult"] != System.DBNull.Value)
            dresult = (int)gvVideo.DataKeys[gvVideo.SelectedIndex].Values["dresult"];

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["DMCOrgStatus"] != null)
            DMCOrgStatus = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["DMCOrgStatus"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["mreview"] != null)
            mreview = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["mreview"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["mresult"] != System.DBNull.Value)
            mresult = (int)gvVideo.DataKeys[gvVideo.SelectedIndex].Values["mresult"];

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MMCOrgStatus"] != null)
            MMCOrgStatus = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MMCOrgStatus"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCYouTubeURL"] != null)
            MCYouTubeURL = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCYouTubeURL"].ToString();

        if (gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCTitle"] != null)
            MCTitle = gvVideo.DataKeys[gvVideo.SelectedIndex].Values["MCTitle"].ToString();

        lbldreceiveTime.Text = MCCreatedDate.ToLongDateString();
        lblmcid.Text = mcid.ToString();
        lblTitle.Text = MCTitle;
        lblPName.Text = PName;
        txtmreview.Text = mreview;
        ddlMCOrgStatus.SelectedValue = MMCOrgStatus;
        ddlmresult.SelectedValue = mresult.ToString();

        lblDeptComment.Text = dreview;
        lblOpenDept.Text = DMCOrgStatus;

        if (dresult == 1)
            lblPassDept.Text = "通過";
        else if (dresult == 0)
            lblPassDept.Text = "不通過";

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT dreview, dresult, MCOrgStatus FROM ReviewDetail WHERE mcid = @mcid";
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@mcid", mcid);
            conn.Open();
            using (SqlDataReader rd = cmd.ExecuteReader())
            {
                int i = 1;
                while (rd.Read())
                { 
                    dreview = "";
                    dresult = -1;
                    if (rd["dreview"] != System.DBNull.Value)
                        dreview = rd["dreview"].ToString();

                    if (rd["dreview"] != System.DBNull.Value)
                        dresult = (int)rd["dresult"];

                    if (rd["dreview"] != System.DBNull.Value)
                        MCOrgStatus = rd["MCOrgStatus"].ToString();

                    string strPass = "";
                    if (dresult == 1)
                        strPass = "通過";
                    else if (dresult == 0)
                        strPass = "不通過";

                    if (i == 1)
                    {
                        lbl1stComment.Text = dreview;
                        lblPass1.Text = strPass;
                        lblOpen1.Text = MCOrgStatus;
                    }
                    if (i == 2)
                    {
                        lbl2stComment.Text = dreview;
                        lblPass2.Text = strPass;
                        lblOpen2.Text = MCOrgStatus;
                    }
                    if (i == 3)
                    {
                        lbl3stComment.Text = dreview;
                        lblPass3.Text = strPass;
                        lblOpen3.Text = MCOrgStatus;
                    }
                    i++;
                }
            }
        }

        MediaPlayerFile file = new MediaPlayerVideoFile();
        file.Sources.Add(new MediaPlayerSource() { Path = MCYouTubeURL });
        ConfigureMediaPlayer(file);
    }


    protected void btnsent_Click(object sender, EventArgs e)
    {
        int pid = (int)Session["PID"];
        string mcid = lblmcid.Text;
        string mreview = txtmreview.Text;
        string mresult = ddlmresult.SelectedValue;
        string MCOrgStatus = ddlMCOrgStatus.SelectedValue;
        DateTime sendtime = DateTime.Now;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update ReviewMain Set msendTime = @msendTime, mreview = @mreview, mresult = @mresult, MCOrgStatus = @MCOrgStatus WHERE mcid = @mcid and pid = @pid";

            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@mcid", mcid);
            cmd.Parameters.AddWithValue("@pid", pid);
            cmd.Parameters.AddWithValue("@MCOrgStatus", MCOrgStatus);
            cmd.Parameters.AddWithValue("@mreview", mreview);
            cmd.Parameters.AddWithValue("@mresult", mresult);
            cmd.Parameters.AddWithValue("@msendtime", sendtime);
            conn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                cmd.CommandText = "Update MediaUpload Set MCApprovalStatus = '已審核', dresult = @dresult, MCOrgStatus = @MCOrgStatus WHERE mcid = @mcid";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@dresult", mresult);
                cmd.Parameters.AddWithValue("@MCOrgStatus", MCOrgStatus);
                cmd.Parameters.AddWithValue("@mcid", mcid);
                result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    dsMediaUploadForJudging.DataBind();
                    gvVideo.DataBind();
                    Response.Write("<script>alert('送出成功!'); </script>");
                }
                else
                {
                    Response.Write("<script>alert('MediaUpload更新失敗!'); </script>");
                }
                //Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('ReviewMain更新失敗!'); </script>");
            }
        }
    }

    protected void btnRetrial_Click(object sender, EventArgs e)
    {
        int pid = (int)Session["PID"];
        string mcid = lblmcid.Text;
        string mreview = txtmreview.Text;
        string mresult = ddlmresult.SelectedValue;
        string MCOrgStatus = ddlMCOrgStatus.SelectedValue;
        DateTime sendtime = DateTime.Now;

        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update ReviewMain Set msendTime = null, mresult = -1 WHERE mcid = @mcid and pid = @pid";

            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@mcid", mcid);
            cmd.Parameters.AddWithValue("@pid", pid);
            //cmd.Parameters.AddWithValue("@MCOrgStatus", DBNull.Value);
            //cmd.Parameters.AddWithValue("@mreview", DBNull.Value);
            //cmd.Parameters.AddWithValue("@mresult", -1);
            //cmd.Parameters.AddWithValue("@msendtime", DBNull.Value);
            conn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                cmd.CommandText = "Update MediaUpload Set MCApprovalStatus = '未審核', dresult = -1 WHERE mcid = @mcid";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@mcid", mcid);
                result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    cmd.CommandText = "Update ReviewDeptDetail Set dsendTime = null, dresult = -1 WHERE mcid = @mcid";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@mcid", mcid);
                    result = cmd.ExecuteNonQuery();

                    if (result == 1)
                    {
                        dsMediaUploadForJudging.DataBind();
                        gvVideo.DataBind();
                        Response.Write("<script>alert('送出成功!'); </script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('ReviewDeptDetail更新失敗!'); </script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('MediaUpload更新失敗!'); </script>");
                }
                //Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('ReviewMain更新失敗!'); </script>");
            }
        }
    }
}
        
    

