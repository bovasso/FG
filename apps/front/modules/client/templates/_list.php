<?php 

$clientPager // Vars: $projectPager
->setOption('ajax', true)
->setOption('first', false) // use a translated text for first button  
->setOption('prev', __('Prev')) // use an image for prev button  
->setOption('next', __('Next'))     // use HTML for next button  
->setOption('last', false);

echo $clientPager->renderNavigationTop('.pager_top');

?>

  
<?php // Vars: $clientPager

echo _open('ul.client_list');

foreach ($clientPager as $client)

{
  echo _open('li');  
     echo _link($client)->text(_media($client->Logo)->size(80,80)->method('top'));
		
    // wrap the article link into a H2 tag with the t_medium CSS class  
    echo _tag('h3', _link($client));  
	
		if ($client->getProject()){
		echo _open('ul.project_list');
			
				foreach($client->getProject() as $client_project){
					echo _open('li'); 
					echo _link($client_project)->text($client_project->title).' (View)';
					echo _close('li'); 
				}
			
		echo _close('ul.project_list'); 
		// end Project List per Client
		}

  echo _close('li');  

}

echo _close('ul');

?>

<?php echo $clientPager->renderNavigationBottom('.pager_bottom');?>

