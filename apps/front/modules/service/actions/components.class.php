<?php
/**
 * Service components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class serviceComponents extends myFrontModuleComponents
{

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->servicePager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->service = $this->getRecord($query);
  }

  public function executeListByServiceCategory(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->servicePager = $this->getPager($query);
  }


}
