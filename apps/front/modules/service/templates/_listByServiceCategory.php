<?php // Vars: $servicePager

echo $servicePager->renderNavigationTop();

echo _open('ul.elements');

foreach ($servicePager as $service)
{

  echo _open('li.element');

    echo $service->name;


  echo _close('li');
}

echo _close('ul');

echo $servicePager->renderNavigationBottom();