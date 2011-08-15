<div class="content_right">

	<?php $projectPager // Vars: $projectPager
	
	->setOption('ajax', true)
	->setOption('first', false) // use a translated text for first button  
	->setOption('prev', __('Prev')) // use an image for prev button  
	->setOption('next', __('Next'))     // use HTML for next button  
	->setOption('last', false)
	->setOption('class', 'dick_pager');
	
	echo $projectPager->renderNavigationTop('.pager_top');
	
	?>

<?php 

echo _open('ul.portofolio_list');

foreach ($projectPager as $project)

{
  echo _open('li');  

     echo _link($project)->text(_media($project->Screenshot)->size(238,104)->method('top'));


    // wrap the article link into a H2 tag with the t_medium CSS class  
    echo _tag('h3', _link($project));  


  echo _close('li');  

}

echo _close('ul');

?>

<?php 

echo $projectPager->renderNavigationBottom('.pager_bottom');

?>

</div>

