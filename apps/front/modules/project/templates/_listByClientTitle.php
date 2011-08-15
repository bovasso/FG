<?php // Vars: $projectPager

echo $projectPager->renderNavigationTop();

echo _open('ul.elements');

foreach ($projectPager as $project)
{
  echo _open('li.element');

    echo _link($project);// ._link($project)->text(' (View)');

  echo _close('li');
}

echo _close('ul');

echo $projectPager->renderNavigationBottom();