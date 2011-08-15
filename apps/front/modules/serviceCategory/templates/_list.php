<?php // Vars: $serviceCategoryPager


echo _open('ul.elements');

foreach ($serviceCategoryPager as $serviceCategory)
{
  echo _open('li.element');

    echo _tag('h3.service_category', $serviceCategory->name);


  echo _close('li');
}

echo _close('ul');