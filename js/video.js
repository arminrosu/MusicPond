// YoutTube iFrame API
var tag = document.createElement('script');
tag.src = "http://www.youtube.com/player_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// the youtube object
var videoPlayer;

function onYouTubePlayerAPIReady() {
	videoPlayer = new YT.Player('videoFrame', {
		height: '100%',
		width: '100%',
		videoId: '',
		events: {
			'onReady': onPlayerReady,
			'onStateChange': onPlayerStateChange
		},
		playerVars: {
			controls: '0',			// Do not display player controls in the video player. The player will appear like a chromeless player.
			iv_load_policy: '0',	// Do not show video annotations.
			rel: '0',				// Do not load related videos. Also, disable the player search functionality, regardless of the showsearch parameter value.
			showinfo: '0'			// Do not information like the video title and rating before the video starts playing.
		},
	});
}

// videos contains the tracks (i.e. playlist)
// videos_index is the currently playing
var videos = [], videos_index = 0;

// storing values on currently playing item
// this is here, only because of issues with the iFrame API (vs. Javascript API)
var now_playing = {
	isMuted: false,
	startSeconds: 0,
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* CONTROL
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
function vp_load(video_id) {

    if (videoPlayer) {
        videoPlayer.loadVideoById(video_id);
        
        update_progress_bar();
        
        video_set_active( video_id );
    }
}

function vp_play() {
	if (videoPlayer) {
		videoPlayer.playVideo();
    }
}

function vp_pause() {
    if (videoPlayer) {
        videoPlayer.pauseVideo();
    }
}

function vp_mute_toggle() {
	console.log('vp_mute_toggle');

	if(videoPlayer && now_playing.isMuted ) {
		videoPlayer.unMute();
		
		now_playing.isMuted = false;
	} else if(videoPlayer) {
		videoPlayer.mute();
		
		now_playing.isMuted = true;
	}
	
	// toggle display (shouldn't be here?!)
	$('.controls .mute').toggleClass('inactive');
}

// Helper Functions
function vp_seek(seconds) {
    if (videoPlayer) {
        videoPlayer.seekTo(seconds, true);
    }
}

function vp_get_time() {
    if (videoPlayer) {
        return videoPlayer.getCurrentTime();
    }
}

function vp_get_duration() {
    if (videoPlayer) {
        return videoPlayer.getDuration();
    }
}

function update_progress_bar() {
    progress_interval = window.setInterval(function(){
        var ratio = vp_get_time() / vp_get_duration();            
        $("#progressBar .elapsed").width( Math.round( ratio * $('#progressBar').outerWidth() ) + 'px');
    }, 1000);
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* EVENTS
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

function onPlayerStateChange(newState) {
  
    switch ( newState.data ) {
        case -1:
            // unstarted
            break;
        case 0:
            // finished
            document.getElementById('play_btn').className = 'finished';
            vp_skip();
            break;
        case 1:
            // playing
            document.getElementById('play_btn').className = 'playing';
            
            // the iFrame API has a quirk, where you have to seek AFTER it started playing,
            // you can't load it already seeked (via cueVideoById or loadVideoById)            
            videoPlayer.seekTo(now_playing.startSeconds);
            // update progressbar
            break;
        case 2:
            // paused
            break;
        case 5:
            // cued
            break;            
    }
}

function onPlayerReady(event) {
	console.log('ready');
	
	// start sync
	sync();
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* PLAYLIST
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
function video_queue( video_id, video_title ) {
	var title = video_title || '';

	var html = '<li id="video_' + video_id + '" style="background-image: url(http://i.ytimg.com/vi/' + video_id + '/2.jpg)">';
	html += '<a class="title" href="#' + video_id + '">' + title + '</a>';
	html += '<a class="remove" href="#">x</a>';
	html += '</li>';

	// update playlist
	$('#playlist').append(html);
	
	// update videos list
	videos.push(video_id);
	
	// update server (?!)
	// console.log(videos);
}

function video_remove( video_id ) {
	// delete list item
	$('#video_' + video_id).remove();
	
	// delete in videos list
	videos = $.grep(videos, function(value) {
		return value != video_id;
	});
}

function video_set_active( videoID ) {
	// get default if not set
	var video_id = videoID || videos[videos_index];
	
	// update index
	videos_index = $.inArray(video_id, videos);
	
	//console.log('set_active: ' + videos_index);

	// reset previous
	$('#playlist li').removeClass('active');
	
	// set current
	$('#video_' + video_id).addClass('active');
	
	// set title
	var title = $('#video_' + video_id + ' .title').text();
	
	$('h1').text( title );
	
	// set page title
	document.title = title + ' | MusicPond';
}

function vp_skip() {
	// notify server
	$.post('playlist.php', {'action': 'play'});
}