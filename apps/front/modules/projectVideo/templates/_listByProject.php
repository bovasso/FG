<?php // Vars: $projectVideoPager

echo _open('ul.media_list.media_images');

foreach ($projectVideoPager as $projectVideo)
{
	/*
	You may want to use oEmbed discovery instead of hard-coding the oEmbed endpoint.
	*/
	$oembed_endpoint = 'http://vimeo.com/api/oembed';

	// Grab the video url from the url, or use default
	$video_url = $projectVideo->url;

	// Create the URLs
	$json_url = $oembed_endpoint . '.json?url=' . rawurlencode($video_url) . '&width=620';
	$xml_url = $oembed_endpoint . '.xml?url=' . rawurlencode($video_url) . '&width=620';

	// Curl helper function


	// Load in the oEmbed XML
	$oembed = simplexml_load_string(curl_get($xml_url));

	/*
	    An alternate approach would be to load JSON,
	    then use json_decode() to turn it into an array.
	*/
	
	
  echo _open('li.element');
		echo _open('div.media_content');
    	echo html_entity_decode($oembed->html);
		echo _close('div.media_content');
		echo _tag('div.media_details', $projectVideo->body);

  echo _close('li');
}

echo _close('ul.media_list.media_images');