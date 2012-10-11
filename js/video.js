/* global: $:true*/

// videos contains the tracks (i.e. playlist)
// videos_index is the currently playing
var videos = [], videos_index = 0;

// storing values on currently playing item
// this is here, only because of issues with the iFrame API (vs. Javascript API)
var now_playing = {
	startSeconds: 0
};

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* PLAYLIST
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
var progress_interval;
function update_progress_bar() {
    progress_interval = window.setInterval(function(){
        var ratio = $video.tubeplayer('data').currentTime / $video.tubeplayer('data').duration;         
        $("#progressBar .elapsed").width( Math.round( ratio * $('#progressBar').outerWidth() ) + 'px');
    }, 1000);
}

function video_queue( video_id, video_title ) {
	var title = video_title || '';

	var html = '<li id="video_' + video_id + '" class="track" style="background-image: url(http://i.ytimg.com/vi/' + video_id + '/2.jpg)">';
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