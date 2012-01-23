<pre>
<?php
	require_once 'config.php';
	require_once ROOT_PATH.'classes/database.php';
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// HELPERS
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	function get_video_details ( $video_id ) 
	{
		$url = 'http://gdata.youtube.com/feeds/api/videos/' . $video_id . '?v=2&alt=jsonc';		
		$str = file_get_contents($url);
		$video = json_decode($str);
		
		return $video->data;
	}
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Database
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	if( !isset($db) ) :
		$db = new Database( DB_HOST, DB_NAME, DB_USER, DB_PASS);
	endif;
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// GET PLAYLIST
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$q = 'SELECT * FROM ' . DB_TABLE . ' WHERE title = "" OR title IS NULL';
	$rows = $db->get( $q );	
	
	// parse
	foreach( $rows as $track ) :
		// get details from youtube
		$video = get_video_details( $track['video_id'] );
		
		$q = '
			UPDATE ' . DB_TABLE . '
			SET 
				title = "' . $video->title . '",
				duration = "' . $video->duration . '"
			WHERE video_id = "' . $track['video_id'] . '"
		';
		
		echo $q;
		$db->query( $q );
		
		echo "\n";
	endforeach;
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// CHECK EMBED-ABILITY (might change in time)
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$q = 'SELECT * FROM ' . DB_TABLE . ' WHERE time_removed IS NULL';
	$rows = $db->get( $q );
	
	foreach ( $rows as $track ) :
		// get details from youtube
		$video = get_video_details( $track['video_id'] );
		
		// check if we can view this
		$embedable = true;
		
		// general denial
		if(	$video->accessControl->embed == 'denied' ) :
			echo 'deny all'."\n";
			$embedable = false;
		endif;
		
		// denied in this country
		if(	$video->restrictions[0]->relationship == 'deny' && strpos($video->restrictions[0]->countries, COUNTRY) !== false ) :
			echo 'deny some:'.$track['video_id']."\n";
			$embedable = false;
		endif;
		
		// not allowed in this country
		if(	$video->restrictions[0]->relationship == 'allow' && strpos($video->restrictions[0]->countries, COUNTRY) === false ) :
			echo 'allow some'."\n";
			$embedable = false;
		endif;
		
		// remove said video
		if ( !$embedable ) :
		
			$q = '
				UPDATE ' . DB_TABLE . '
				SET time_removed = NOW()
				WHERE video_id = "' . $track['video_id'] . '"
			';
			
			echo $q;
			$db->query( $q );
			
			echo "\n";
		endif;
	endforeach;
	
?></pre>