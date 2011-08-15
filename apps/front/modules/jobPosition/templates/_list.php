<div id="fg_jobslisting_wrapper">
	
	<div id="fg_jobscontent_wrapper">

	<div id="fg_joblisting_l">
		<?php // Vars: $jobPositionPager

		echo $jobPositionPager->renderNavigationTop();

		echo _open('ul.fg_red_list');

		foreach ($jobPositionPager as $jobPosition)
		{
		  echo _open('li.element');

		    echo _link($jobPosition);

		  echo _close('li');
		}

		echo _close('ul');

		echo $jobPositionPager->renderNavigationBottom();
	?>
	</div>

		<div class="fg_round_box">
			<h4>Interested in working at FG but don't see a job matching your background?</h4>
			<p>
				We're always looking for talented people. Please <a href="/contact">drop us a line</a> and maybe we can find a fit for you! All resume submissions are kept on file and we will contact you should a suitable position become available. Please no phone calls or unscheduled visits.
			</p>
		</div>
	
	</div>
	
</div>
