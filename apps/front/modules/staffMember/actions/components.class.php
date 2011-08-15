<?php
/**
 * Employee components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class staffMemberComponents extends myFrontModuleComponents
{

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->staffMemberPager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->staffMember = $this->getRecord($query);
  }

  public function executeListByDept(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->staffMemberPager = $this->getPager($query);
  }


}
