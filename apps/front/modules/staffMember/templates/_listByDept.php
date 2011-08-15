<?php // Vars: $staffMemberPager

echo $staffMemberPager->renderNavigationTop();

echo _open('ul.elements');

foreach ($staffMemberPager as $staffMember)
{
  echo _open('li.element');

    echo _link($staffMember);

  echo _close('li');
}

echo _close('ul');

echo $staffMemberPager->renderNavigationBottom();