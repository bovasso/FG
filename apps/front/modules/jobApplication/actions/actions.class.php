<?php
/**
 * Job Application actions
 */
class jobApplicationActions extends myFrontModuleActions
{

  public function executeFormWidget(dmWebRequest $request)
  {
    $form = new JobApplicationForm();
        
    if ($request->hasParameter($form->getName()) && $form->bindAndValid($request))
    {
      $form->save();
			$this->getUser()->setFlash('job_application_form_valid', true);  
      $this->redirectBack();
    }
    
    $this->forms['JobApplication'] = $form;
  }


}
