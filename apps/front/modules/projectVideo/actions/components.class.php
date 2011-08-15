<?php
/**
 * Case Study Video components
 * 
 * No redirection nor database manipulation ( insert, update, delete ) here
 */
class projectVideoComponents extends myFrontModuleComponents
{
	
  public function executeList(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->projectVideoPager = $this->getPager($query);
  }

  public function executeShow(dmWebRequest $request)
  {
    $query = $this->getShowQuery();
    
    $this->projectVideo = $this->getRecord($query);
  }

  public function executeListByProject(dmWebRequest $request)
  {
    $query = $this->getListQuery();
    
    $this->projectVideoPager = $this->getPager($query);

		function curl_get($url) {
		    $curl = curl_init($url);
		    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
		    curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		    $return = curl_exec($curl);
		    curl_close($curl);
		    return $return;
		}

  }


}
