<?php
/**
 * About Slide components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class aboutSlideshowComponents extends myFrontModuleComponents
{

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->aboutSlideshowPager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->aboutSlideshow = $this->getRecord($query);
  }


}
