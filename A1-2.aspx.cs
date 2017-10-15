using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class A1_2 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

    private void ConfigureMediaPlayer(MediaPlayerFile file)
    {
        RadMediaPlayer1.Sources.Clear();
        RadMediaPlayer1.StartTime = 0;
        RadMediaPlayer1.Muted = false;
        RadMediaPlayer1.AutoPlay = true;

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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
        MediaPlayerFile file = new MediaPlayerVideoFile();
        file.Sources.Add(new MediaPlayerSource() { Path = gvVideo.SelectedDataKey.Value.ToString() });
        ConfigureMediaPlayer(file);
    }
}