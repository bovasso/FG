<section id="about_carousel">
	<?php
		/*
		 * A $tweet is an array containing:
		 * - text:        text of the tweet
		 * - created_at:  when the tweet was posted, timestamp
		 */
		echo _open('ul');

		foreach($aboutSlideshowPager as $aboutSlideshow)
		{
		  echo _open('li');
		    // render tweet text
				echo _tag('h2.make_it_work',$aboutSlideshow->title);
				echo _open('div.details');
				echo _tag('h3.title',$aboutSlideshow->subtitle);
		    echo markdown($aboutSlideshow->description);
				echo _close('div.details');
			echo _close('li');
		}

		echo _close('ul');

	?>
  <div class="carousel_buttons">
    <a href="#" id="about_carousel_next" class="img_replace" title="Next">Next &raquo;</a>
    <a href="#" id="about_carousel_prev" class="img_replace" title="Prev">&laquo; Prev</a>
  </div>
</section>

