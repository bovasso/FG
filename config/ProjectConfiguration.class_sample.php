<?php

require_once '/Volumes/Data/Sites/fgwww/lib/vendor/diem/dmCorePlugin/lib/core/dm.php';
dm::start();

class ProjectConfiguration extends dmProjectConfiguration
{

  public function setup()
  {
    parent::setup();
    
    $this->enablePlugins(array(
      // add plugins you want to enable here
		'dmContactPlugin',
		'dmTagPlugin' ,
		'dmWidgetTwitterPlugin',
		'dmMediaUploadifyerPlugin'
    ));

    $this->setWebDir(sfConfig::get('sf_root_dir').'/web');
  }
  
}