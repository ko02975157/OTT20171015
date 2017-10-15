using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class A2_2 : System.Web.UI.Page
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

         if (gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCCreatedDate"] != System.DBNull.Value)
            MCCreatedDate = (DateTime)gvForJudgingVideo.DataKeys[gvForJudgingVideo.SelectedIndex].Values["MCCreatedDate"];

        lbldreceiveTime.Text = MCCreatedDate.ToLongDateString();
        lblmcid.Text = mcid.ToString();
        lblTitle.Text = MCTitle;
        lblPName.Text = PName;
        ddlMCOrgStatus.SelectedValue = MyMCOrgStatus;

        MediaPlayerFile file = new MediaPlayerVideoFile();
        file.Sources.Add(new MediaPlayerSource() { Path = MCYouTubeURL });
        ConfigureMediaPlayer(file);
    }
    protected void btnsent_Click(object sender, EventArgs e)
    {
        int pid = (int)Session["PID"];
        string mcid = lblmcid.Text;
        string review = txtdreview.Text;
        string dresult = ddldresult.SelectedValue;
        string MCOrgStatus = ddlMCOrgStatus.SelectedValue;
        DateTime sendtime = DateTime.Now;


        using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Update ReviewDeptDetail Set dsendTime = @dsendTime, dreview = @dreview, dresult = @dresult, MCOrgStatus = @MCOrgStatus WHERE mcid = @mcid and pid = @pid";

            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@mcid", mcid);
            cmd.Parameters.AddWithValue("@pid", pid);
            cmd.Parameters.AddWithValue("@MCOrgStatus", MCOrgStatus);
            cmd.Parameters.AddWithValue("@dreview", review);
            cmd.Parameters.AddWithValue("@dresult", dresult);
            cmd.Parameters.AddWithValue("@dsendtime", sendtime);
            conn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                dsMediaUploadForJudging.DataBind();
                gvForJudgingVideo.DataBind();
                Response.Write("<script>alert('送出成功!'); </script>");
                //Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("<script>alert('送出失敗!'); </script>");
            }
        }
    }




	protected void InterviewDateBtn_Click(object sender, EventArgs e)
	{
		InterviewCalendar1.Visible = true;
	}

	protected void InterviewDateBtn2_Click(object sender, EventArgs e)
	{
		InterviewCalendar2.Visible = true;
	}

	protected void InterviewCalendar_SelectionChanged(object sender, EventArgs e)
	{
		txtFromDate.Text = InterviewCalendar1.SelectedDate.Date.Year.ToString();
		txtFromDate.Text += "/" + InterviewCalendar1.SelectedDate.Date.Month.ToString();
		txtFromDate.Text += "/" + InterviewCalendar1.SelectedDate.Date.Day.ToString();
		InterviewCalendar1.Visible = false;
	}

	protected void InterviewCalendar2_SelectionChanged(object sender, EventArgs e)
	{
		txtToDate.Text = InterviewCalendar2.SelectedDate.Date.Year.ToString();
		txtToDate.Text += "/" + InterviewCalendar2.SelectedDate.Date.Month.ToString();
		txtToDate.Text += "/" + InterviewCalendar2.SelectedDate.Date.Day.ToString();
		InterviewCalendar2.Visible = false;
	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		string fromDate = txtFromDate.Text;
		fromDate = fromDate + " 00:00:00.000";
		string toDate = txtToDate.Text;
		toDate = toDate + " 23:59:59.999";
		string sqlCmd = "SELECT MediaUpload.MCID, MediaUpload.MCYouTubeURL, MediaUpload.MCTitle, MediaUpload.MCCreatedDate, MediaUpload.MCOrgStatus, ReviewDeptDetail.MCOrgStatus as MyMCOrgStatus, ReviewDeptDetail.dresult, Person.PName FROM MediaUpload INNER JOIN ReviewDeptDetail ON MediaUpload.MCID = ReviewDeptDetail.mcid INNER JOIN Person ON MediaUpload.PID = Person.PID WHERE (ReviewDeptDetail.PID = @PID) AND (ReviewDeptDetail.dresult = -1)";
		sqlCmd = sqlCmd + " and MediaUpload.MCCreatedDate > " + fromDate + " and MediaUpload.MCCreatedDate < " + toDate;
		dsMediaUploadForJudging.SelectCommand = sqlCmd;
		dsMediaUploadForJudging.DataBind();
		gvForJudgingVideo.DataBind();
	}
}
        
    

