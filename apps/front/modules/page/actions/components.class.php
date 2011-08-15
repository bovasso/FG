<?php
/**
 * Page components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class pageComponents extends myFrontModuleComponents
{

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->pagePager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->page = $this->getRecord($query);
  }


}
