<dl class="main_sidebar">
  <dt>View:</dt>
  <dd>
    <ul>
      <li class="case_studies"><?php echo _link('/portfolio')->text('Case Studies')->currentClass('my_current_class'); ?></li>
      <li class="clients"><?php echo _link('/portfolio/clients')->text('Clients')->currentClass('my_current_class'); ?></li>
    </ul>
  </dd>
</dl>
<dl class="inner_sidebar filter_block">
  <dt>Filter By Category:</dt>
  <dd>
	<?php // Vars: $categoryPager

	echo $categoryPager->renderNavigationTop();

	echo _open('ul.elements');

	foreach ($categoryPager as $category)
	{
	  echo _open('li.element');

	    echo _link($category);

	  echo _close('li');
	}

	echo _close('ul');

	echo $categoryPager->renderNavigationBottom();
	?>
  </dd>
</dl>
