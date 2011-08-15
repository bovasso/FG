<?php
/**
 * Job Application components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class jobApplicationComponents extends myFrontModuleComponents
{

  public function executeForm(dmWebRequest $request)
  {
    $this->form = $this->forms['JobApplication'];
  }


}
