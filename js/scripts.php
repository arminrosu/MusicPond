<?php
	$scripts = array(
		'sync.js',
		'video.js',
		'script.js'
	);
	
	foreach ($scripts as $script) :
		$content = file_get_contents($script);
		
		echo  $content;
	endforeach;

?>