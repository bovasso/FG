<?php use_helper('Text'); use_helper('Date');
/*
 * A $tweet is an array containing:
 * - text:        text of the tweet
 * - created_at:  when the tweet was posted, timestamp
 */

echo _tag('h3.tweets_title','Recent Tweets');


foreach($tweets as $tweet)
{
  echo _open('div.tweet');
    // render tweet text
  echo  _tag('p.tweet_text', auto_link_text($tweet['text']));
	echo _close('div.tweet');
	
}


?>
<a href="http://www.twitter.com/funnygarbage" class="more" target="_blank">See More on Twitter</a>

