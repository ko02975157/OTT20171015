using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class A4_2 : System.Web.UI.Page
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
        lbl1stComment.Text = "";
        lbl2stComment.Text = "";
        lbl3stComment.Text = "";
        lblCollComment.Text = "";
        lblDeptComment.Text = "";
        lblOpen1.Text = "";
        lblOpen2.Text = "";
        lblOpen3.Text = "";
        lblOpenColl.Text = "";
        lblOpenDept.Text = "";
        lblPass1.Text = "";
        lblPass2.Text = "";
        lblPass3.Text = "";
        lblPassColl.Text = "";
        lblPassDept.Text = "";

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


        lblDeptComment.Text = dreview;
        lblOpenDept.Text = DMCOrgStatus;

        if (dresult == 1)
            lblPassDept.Text = "通過";
        else if (dresult == 0)
            lblPassDept.Text = "不通過";

        lblCollComment.Text = mreview;
        lblOpenColl.Text = MMCOrgStatus;

        if (mresult == 1)
            lblPassColl.Text = "通過";
        else if (mresult == 0)
            lblPassColl.Text = "不通過";

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

}
        
    

