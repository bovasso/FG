<?php // Vars: $projectPager

echo _open('ul.portofolio_top');

foreach ($projectPager as $project)
{
  echo _open('li.featured-item');

    echo _link($project)->text(_media($project->Screenshot)->size(298,131)->method('top'));
	// wrap the article link into a H2 tag with the t_medium CSS class  
    echo _tag('h3', _link($project));

		echo markdown($project->extract);

  echo _close('li');
}

echo _close('ul');