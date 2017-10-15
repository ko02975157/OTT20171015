using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class A3_3 : System.Web.UI.Page
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
    protected void gvForJudgingVideo_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbldreceiveTime.Text = "";
        lblmcid.Text = "";
        lblPName.Text = "";
        lblTitle.Text = "";
        txtdreview.Text = "";

        int mcid = (int)gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCID"];
        string MCYouTubeURL = "";
        string MCTitle = "";
        DateTime MCCreatedDate = DateTime.Now;
        string MCOrgStatus = "";
        string MyMCOrgStatus = "";
        string PName = "";
        string dreview = "";
        int dresult = -1;

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["PName"] != null)
            PName = gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["PName"].ToString();

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCYouTubeURL"] != null)
            MCYouTubeURL = gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCYouTubeURL"].ToString();

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCOrgStatus"] != null)
            MCOrgStatus = gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCOrgStatus"].ToString();

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MyMCOrgStatus"] != null)
            MyMCOrgStatus = gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MyMCOrgStatus"].ToString();

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCTitle"] != null)
            MCTitle = gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCTitle"].ToString();

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["dreview"] != null)
            dreview = gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["dreview"].ToString();

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCCreatedDate"] != System.DBNull.Value)
            MCCreatedDate = (DateTime)gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCCreatedDate"];

        if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["dresult"] != System.DBNull.Value)
            dresult = (int)gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["dresult"];

        lbldreceiveTime.Text = MCCreatedDate.ToLongDateString();
        lblmcid.Text = mcid.ToString();
        lblTitle.Text = MCTitle;
        lblPName.Text = PName;
        txtdreview.Text = dreview;
        ddlMCOrgStatus.SelectedValue = MyMCOrgStatus;
        ddldresult.SelectedValue = dresult.ToString();

        MediaPlayerFile file = new MediaPlayerVideoFile();
        file.Sources.Add(new MediaPlayerSource() { Path = MCYouTubeURL });
        ConfigureMediaPlayer(file);
    }
}
        
    

