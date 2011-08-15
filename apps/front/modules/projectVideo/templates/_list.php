<?php // Vars: $projectVideoPager

echo $projectVideoPager->renderNavigationTop();

echo _open('ul.elements');

foreach ($projectVideoPager as $projectVideo)
{
  echo _open('li.element');

    echo _link($projectVideo);

  echo _close('li');
}

echo _close('ul');

echo $projectVideoPager->renderNavigationBottom();