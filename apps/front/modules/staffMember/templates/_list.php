
<?php // Vars: $staffMemberPager
echo _open('section.leadership_content');
echo _open('ul.elements');

foreach ($staffMemberPager as $staffMember)
{
  echo _open('li.element');

			echo _media($staffMember->Photo)->size(140,190)->method('top');
			echo _open('div.leader');

   	 // wrap the article link into a H2 tag with the t_medium CSS class  
	    echo _tag('h4.name',$staffMember->name);
			echo _tag('h5.job', $staffMember->title);
			echo markdown($staffMember->bio);
			
			echo _close('div.leader');

  echo _close('li');
}

echo _close('ul');

echo _close('section.leadership_content');