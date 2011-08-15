<?php
/**
 * Job Position components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 * 
 */
class jobPositionComponents extends myFrontModuleComponents
{

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->jobPositionPager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->jobPosition = $this->getRecord($query);
  }

  public function executeListByDept(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->jobPositionPager = $this->getPager($query);
  }


}
