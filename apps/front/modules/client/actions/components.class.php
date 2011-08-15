<?php
/**
 * Client components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 * 
 */
class clientComponents extends myFrontModuleComponents
{

  public function executeList()
  {
    $query = $this->getListQuery();
    
    $this->clientPager = $this->getPager($query);
  }

  public function executeShow()
  {
    $query = $this->getShowQuery();
    
    $this->client = $this->getRecord($query);
  }

  public function executeListWithProjects()
  {
    $query = $this->getListQuery();
    
    $this->clientPager = $this->getPager($query);
  }


}
