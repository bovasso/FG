<?php // Vars: $jobPosition

echo _open('div.job_position');

	echo _tag('h2','Jobs: '.$jobPosition->name);
	
	if($jobPosition->description){
	echo _tag('h3','Job Description:');
	echo markdown($jobPosition->description);
	}
	
	if ($jobPosition->qualifications){
	echo _tag('h3','Qualifications:');
	echo markdown($jobPosition->qualifications);
	}
		
	if ($jobPosition->additional_areas){
	echo _tag('h3','Additional Areas of Knowledge (helpful, but not required):');
	echo markdown($jobPosition->additional_areas);
	}
	
	if($jobPosition->required_skills){
	echo _tag('h3','Required Skills:');
	echo markdown($jobPosition->required_skills);
	}

echo _close('div.job_position');