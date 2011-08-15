<?php // Vars: $projectPager

echo $projectPager->renderNavigationTop();

echo _open('ul.related_list');

foreach ($projectPager as $project)
{
  echo _open('li');

    echo _tag('span', $project) . _link($project)->text(' (View)');

  echo _close('li');
}

echo _close('ul');

echo $projectPager->renderNavigationBottom();