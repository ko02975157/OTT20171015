using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using Telerik.Web.UI;

public partial class A1_1 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["PID"] != null)
		{
			lblName.Text = Session["PName"].ToString();
			lblDepartment.Text = Session["PDepartmentName"].ToString();
        }
		else
		{
			Response.Write("<script>alert('您未登入，前往登入'); location.href='MAIN.aspx'; </script>");
			//Response.Redirect("login.aspx");

		}

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

	protected void btnMediaUpload_Click1(object sender, EventArgs e)
	{
        int pid = (int)Session["PID"];
		string youtubeurl = radtxtYouTubeURL.Text;
		string title = txtTitle.Text;
		string pname = lblName.Text;
		string orgstatus = ddlOrgStatus.SelectedValue;
		string restrictpw = txtRestrictPW.Text;
        int department = (int)Session["PDepartment"];

        DateTime createdtime = DateTime.Now;
		List<Judger> judgerList = new List<Judger>();

		using (SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
		{
			SqlCommand cmd = new SqlCommand();
			cmd.CommandText = "Insert Into MediaUpload (MCYouTubeURL,MCTitle,PID,MCDepartment,MCRestrictPW,MCCreatedDate,MCOrgStatus,MCApprovalStatus) OUTPUT INSERTED.MCID VALUES (@MCYouTubeURL,@MCTitle,@PID,@MCDepartment,@MCRestrictPW,@MCCreatedDate,@MCOrgStatus,'未審核')";
			cmd.Connection = conn;
			cmd.Parameters.AddWithValue("@MCYouTubeURL", youtubeurl);
			cmd.Parameters.AddWithValue("@MCTitle", title);
			cmd.Parameters.AddWithValue("@PID", pid);
			cmd.Parameters.AddWithValue("@MCDepartment", department);
			cmd.Parameters.AddWithValue("@MCRestrictPW", restrictpw);
			cmd.Parameters.AddWithValue("@MCCreatedDate", createdtime);
			cmd.Parameters.AddWithValue("@MCOrgStatus", orgstatus);
			conn.Open();
			int mcid = (int) cmd.ExecuteScalar();
			if (mcid > 0)
			{
				try
				{
					string sqlStatement = "Select PID From Person Where PRoleType= @PRoleType and PTitle=@PTitle and PDepartment=@PDepartment";
					SqlCommand cmd2 = new SqlCommand(sqlStatement, conn);
					cmd2.Parameters.AddWithValue("@PRoleType", 2);
                    cmd2.Parameters.AddWithValue("@PTitle", 2);
                    cmd2.Parameters.AddWithValue("@PDepartment", department);
					Random rnd = new Random(DateTime.Now.Second);

					using (SqlDataReader rd = cmd2.ExecuteReader())
					{
						while (rd.Read())
						{
							int pId = (int)rd["PID"];
							Judger jarger = new Judger();
							jarger.pid = pId;
							jarger.seq = rnd.Next();
							judgerList.Add(jarger);
						}
					}
					judgerList.Sort();
					int i = 0;
                    DateTime assignTime = DateTime.Now;
					foreach (Judger jarger in judgerList)
					{
						if (jarger == null)
							break;
						if (i > 2)
							break;
						cmd2.CommandText = "Insert INTO ReviewDetail (MCID, PID, dreceiveTime, dresult) VALUES (@MCID, @PID, @dreceiveTime, @dresult)";
						cmd2.Parameters.Clear();
                        cmd2.Parameters.AddWithValue("@MCID", mcid);
                        cmd2.Parameters.AddWithValue("@PID", jarger.pid);
                        cmd2.Parameters.AddWithValue("@dreceiveTime", assignTime);
                        cmd2.Parameters.AddWithValue("@dresult", -1);
                        cmd2.ExecuteNonQuery();
						//將jarger的pid寫入到此影片的評審欄位
						i++;
					}

                    cmd2.CommandText = "Select PID, PTitle from person where (ptitle = 3 or ptitle = 4) and PDepartment = @PDepartment";
                    cmd2.Parameters.Clear();
                    cmd2.Parameters.AddWithValue("@PDepartment", department);
                    using (SqlDataReader rd = cmd2.ExecuteReader())
                    {
                        while (rd.Read())
                        {
                            int pId = (int)rd["PID"];
                            int pTitle = (int)rd["PTitle"];

                            if (pTitle == 3)
                            {
                                using (SqlConnection conn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
                                {
                                    SqlCommand cmd3 = new SqlCommand();
                                    cmd3.Connection = conn1;
                                    conn1.Open();
                                    cmd3.CommandText = "Insert INTO ReviewDeptDetail (MCID, PID, dreceiveTime, dresult) VALUES (@MCID, @PID, @dreceiveTime, @dresult)";
                                    cmd3.Parameters.Clear();
                                    cmd3.Parameters.AddWithValue("@MCID", mcid);
                                    cmd3.Parameters.AddWithValue("@PID", pId);
                                    cmd3.Parameters.AddWithValue("@dreceiveTime", assignTime);
                                    cmd3.Parameters.AddWithValue("@dresult", -1);
                                    cmd3.ExecuteNonQuery();
                                }
                            }
                            if (pTitle == 4)
                            {
                                using (SqlConnection conn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["OTTConnectionString"].ConnectionString))
                                {
                                    SqlCommand cmd3 = new SqlCommand();
                                    cmd3.Connection = conn1;
                                    conn1.Open();
                                    cmd3.CommandText = "Insert INTO ReviewMain (MCID, PID, mreceiveTime, mresult) VALUES (@MCID, @PID, @mreceiveTime, @mresult)";
                                    cmd3.Parameters.Clear();
                                    cmd3.Parameters.AddWithValue("@MCID", mcid);
                                    cmd3.Parameters.AddWithValue("@PID", pId);
                                    cmd3.Parameters.AddWithValue("@mreceiveTime", assignTime);
                                    cmd3.Parameters.AddWithValue("@mresult", -1);
                                    cmd3.ExecuteNonQuery();
                                }

                            }

                        }
                    }

                    //this.lblshow.Text = "資料連線成功";

                }
                catch (Exception ex)
				{
					//this.lblshow.Text = "資料連線錯誤";
				}
				Response.Write("<script>alert('影片上傳成功!,前往首頁'); location.href='Default.aspx'; </script>");
				//Response.Redirect("MediaUpload.aspx");
			}
		}
	}

	protected void btnClean_Click1(object sender, EventArgs e)
	{
		radtxtYouTubeURL.Text = "";
		txtTitle.Text = "";
		txtRestrictPW.Text = " ";
		ddlOrgStatus.Text = " ";
	}


	protected void RadButton1_Click(object sender, EventArgs e)
	{
		MediaPlayerFile file = new MediaPlayerVideoFile();
		file.Sources.Add(new MediaPlayerSource() { Path = radtxtYouTubeURL.Text });
		ConfigureMediaPlayer(file);
	}

    protected void radtxtYouTubeURL_TextChanged(object sender, EventArgs e)
    {
        MediaPlayerFile file = new MediaPlayerVideoFile();
        file.Sources.Add(new MediaPlayerSource() { Path = radtxtYouTubeURL.Text });
        ConfigureMediaPlayer(file);
    }
}
