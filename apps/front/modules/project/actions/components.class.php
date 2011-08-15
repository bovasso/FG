<?php
/**
 * Case Study components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */
class projectComponents extends myFrontModuleComponents
{

  public function executeList()
  {
    $query = $this->getListQuery();
    
    $this->projectPager = $this->getPager($query);
    	$this->projectPager
    // use HTML for next button   	
    	->setOption('class', 'pagination');         // disable last button
  }

  public function executeListShow()
  {
    $query = $this->getListQuery();
    
    $this->projectPager = $this->getPager($query);
  }

  public function executeShow()
  {
    $query = $this->getShowQuery();
    
    $this->project = $this->getRecord($query);
    
    $this->previous = $this->project->getPrevious();
    
    $this->count = $this->project->count();
    
    $this->next = $this->project->getNext();
    
    $this->preloadPages(array($this->previous, $this->next));
  }

  public function executeListPager()
  {
    $query = $this->getListQuery();
    $this->projectPager = $this->getPager($query);

  }

  public function executeListByCategory()
  {
    $query = $this->getListQuery();
    
    $this->projectPager = $this->getPager($query);
  }

  public function executeListRelated()
  {
    $query = $this->getListQuery();
    
    $this->projectPager = $this->getPager($query);
  }

  public function executeListFeatured(dmWebRequest $request)
  {
    $query = $this->getListQuery('project')
    	->addWhere('project.is_featured LIKE ?', 1);
    
    $this->projectPager = $this->getPager($query);
  }

  public function executeListFeaturedByCategory(dmWebRequest $request)
  {
    $query = $this->getListQuery('project')
    	->addWhere('project.is_featured LIKE ?', 1);
    
    $this->projectPager = $this->getPager($query);
  }

  public function executeListByClient()
  {
    $query = $this->getListQuery();
    
    $this->projectPager = $this->getPager($query);
  }

  public function executeListByClientTitle()
  {
    $query = $this->getListQuery();
			
    $this->projectPager = $this->getPager($query);
		
  }


}
