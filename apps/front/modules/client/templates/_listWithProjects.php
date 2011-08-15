<?php // Vars: $clientPager

echo $clientPager->renderNavigationTop();

echo _open('ul.elements');

foreach ($clientPager as $client)
{
  echo _open('li.element');

    echo _link($client);

  echo _close('li');
}

echo _close('ul');

echo $clientPager->renderNavigationBottom();