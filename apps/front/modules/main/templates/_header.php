<div id="search">
  <p id="btn_search"><a href="#" title="Search" class="img_replace">Search</a></p>

	<?php echo dm_get_widget('dmWidgetSearch', 'form', array(
	  'css_class' => 'search_bar'  
	));?>

  <script type="text/javascript">
    $(function() {
      $('p#btn_search a').click(function() { 
        $(this).addClass('active');
        $('#search form').show();
        return false;
      });
    });
  </script>

</div>
<!--// END search -->

<h1><a href="/" id="logo" class="img_replace" title="Funny Garbage">Funny Garbage</a><span>Interactive experiences for entertainment, culture and commerce</span></h1>
<!--// END menu -->

<nav class="gnav">
	<?php // Vars: $clientPager

	echo _open('ul.menu');


	  echo _open('li.element');

	    echo _link('/')->text('Home');

	  echo _close('li');
	
		echo _open('li.element');

	    echo _link('/about')->text('About')->currentSpan(true);

	  echo _close('li');
	
		echo _open('li.element');

	    echo _link('#')->text('Blog');

	  echo _close('li');
	
		echo _open('li.element');

	    echo _link('/portfolio')->text('Portfolio');

	  echo _close('li');
	
		echo _open('li.element');

	    echo _link('/jobs')->text('Jobs');

	  echo _close('li');
	
		echo _open('li.element');

	    echo _link('/contact')->text('Contact');

	  echo _close('li');


	echo _close('ul');
	?>
</nav>