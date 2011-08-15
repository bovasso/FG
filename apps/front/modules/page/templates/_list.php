<?php // Vars: $pagePager

echo $pagePager->renderNavigationTop();

echo _open('ul.elements');

foreach ($pagePager as $page)
{
  echo _open('li.element');

    echo $page;

  echo _close('li');
}

echo _close('ul');

echo $pagePager->renderNavigationBottom();