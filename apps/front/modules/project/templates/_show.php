<div id="portfolio_hdr">
    <?php
    
			echo 
				_tag('ul.pagination.middle',
				($previous ? _tag('li.prev', _link($previous)->set('.prev')->text('Previous&nbsp;&nbsp;')) : '').
				_tag('li',_link($project->Category).' Case Studies ').
				($next ? _tag('li.next', _link($next)->set('.next')->text('&nbsp;&nbsp;Next')) : '')
				);
    ?>
    <!--// END pagination -->
    
    <h2 class="hdr">Portfolio</h2>
	
	  
    <div id="s_nav_wrapper">
      <!--// END p_snav -->
	<?php echo _tag('h3.shdr', $project->title); ?>
    </div>

  </div>
  <!--// END portfolio hdr -->
<?php echo _open('div#client-tabs');  ?>  

	<ul class="tabs">
	  <li><a href="#oview_wrapper" title="Overview">Overview</a>&nbsp;&nbsp;/&nbsp;</li>
	  <li><a href="#images" title="Images">Images</a>&nbsp;&nbsp;/&nbsp;</li>
	  <li><a href="#video" title="Video">Video</a></li>
	</ul>
	
  <div id="oview_wrapper" class="client-tabs">
    <div id="oview_left">
      <?php
      	echo _open('div.img-container');

      		echo _media($project->Screenshot)->size(404)->set('.flimage'); 

    	echo _close('div.img-container');
		//end Image container
      ?>
			<?php if ($project->awards):?>
      	<h3 class="shdr">Highlights:</h3>
	      <div id="highlights">
					<?php echo markdown($project->awards);?>
	      </div>
			<?php endif; ?>
    </div>
    <!--// END oview left -->
    
    <div id="oview_right">
	
      <div id="oview_content">
	
		<?php echo _tag('h4.hdr', 'Client:'); ?>
		<?php echo _tag('p.title', $project->Client); ?>
		<?php echo _tag('h4.hdr', 'Project Description:'); ?>
		<?php echo markdown($project->overview);?>
		<?php
		
		$first = true;
        foreach($project->getTags() as $dmTag){
            if($first){
               $tags = $dmTag->getName();
               $first = false;
            }else{
               $tags .= ', '.$dmTag->getName();
            }
        }      
		 
		?>		
        <p class="tags"><span class="hdr">Tags: </span><?php echo $tags ?></p>

      </div>
      <!--// END oview content -->
      
      <div id="share_wrapper">
       	
				<?php echo dm_get_widget('client', 'show', array('recordId' => $project->client,'orderField'  => 'title','orderType'   => 'asc'));?>
				
        <h3 class="shdr">Share</h3>
        <ul id="share_links">
          <li><a href="#" title="Facebook" class="facebook">Facebook</a></li>
          <li><a href="#" title="Twitter" class="twitter">Twitter</a></li>
          <li><a href="#" title="Digg" class="digg">Digg</a></li>
          <li><a href="#" title="Delicious" class="delicious">Delicious</a></li>
          <li><a href="#" title="E-mail" class="email">E-mail</a></li>
          <li class="last"><a href="#" title="Print" class="print">Print</a></li>
        </ul>
      </div>
      <!--// END share links -->
      
    </div>
    <!--// END oview right -->
    
    <div class="related_projects">
      <div class="related_projects_wrapper">
        <div class="related_left">Related Projects</div>
		<?php 
			echo dm_get_widget('project', 'listRelated', array(
				'recordId' => $project->category_id,
				'orderField'  => 'title', //required  
			  	'orderType'   => 'asc',   //required  
			  	'maxPerPage'  => 3       //optional
			));?>
      </div>
    </div>
    <!--// END related projects -->
    
  	</div>
	<!-- end Overview TAB -->

	<?php echo _open('div#images.client-tabs')?>

		<?php

	    echo _open('ul.media_list.media_images');

	    foreach($project->getDmGallery() as $media)  

	    {  
	      echo _open('li'); 

	        echo _tag('div.media_content', _media($media)->size(640)->method('top'));  
	        echo _tag('div.media_details', $media->legend);

	      echo _close('li');
	    }
	    echo _close('ul');
	?>

	<?php echo _close('div#images.client-tabs')?>
	<!-- end Images Tab -->
	
	<?php echo _open('div#video.client-tabs')?>
	
	
	<?php // Vars: $projectVideoPager

	echo _open('ul.media_list.media_images');
	
	function curl_get($url) {
	    $curl = curl_init($url);
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($curl, CURLOPT_TIMEOUT, 30);
	    $return = curl_exec($curl);
	    curl_close($curl);
	    return $return;
	}

	foreach($project->getProjectVideo() as $projectVideo)
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
	
	?>
	
	<?php echo _close('div#video.client-tabs')?>

	<?php echo _close('div#client_tabs') ?>

