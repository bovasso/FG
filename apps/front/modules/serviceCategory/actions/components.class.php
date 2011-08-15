<?php
/**
 * Service Category components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class serviceCategoryComponents extends myFrontModuleComponents
{

  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->serviceCategoryPager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->serviceCategory = $this->getRecord($query);
  }


}
