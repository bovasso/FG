<?php

/**
 * Project form base class.
 *
 * @method Project getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id$
 */
abstract class BaseProjectForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'          => new sfWidgetFormInputHidden(),
      'title'       => new sfWidgetFormInputText(),
      'category_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Category'), 'add_empty' => false)),
      'extract'     => new sfWidgetFormTextarea(),
      'overview'    => new sfWidgetFormTextarea(),
      'launch_date' => new sfWidgetFormInputText(),
      'url'         => new sfWidgetFormInputText(),
      'awards'      => new sfWidgetFormTextarea(),
      'screenshot'  => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Screenshot'), 'add_empty' => true)),
      'thumbnail'   => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Thumbnail'), 'add_empty' => true)),
      'client'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Client'), 'add_empty' => false)),
      'client_2'    => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Client2'), 'add_empty' => true)),
      'client_3'    => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Client3'), 'add_empty' => true)),
      'is_featured' => new sfWidgetFormInputCheckbox(),
      'is_active'   => new sfWidgetFormInputCheckbox(),
      'position'    => new sfWidgetFormInputText(),

        'tags_list'   => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'expanded' => true)),
      ));

    $this->setValidators(array(
      'id'          => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'title'       => new sfValidatorString(array('max_length' => 120)),
      'category_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Category'))),
      'extract'     => new sfValidatorString(array('max_length' => 300, 'required' => false)),
      'overview'    => new sfValidatorString(array('max_length' => 2000)),
      'launch_date' => new sfValidatorString(array('max_length' => 60, 'required' => false)),
      'url'         => new dmValidatorLinkUrl(array('max_length' => 200, 'required' => false)),
      'awards'      => new sfValidatorString(array('max_length' => 500, 'required' => false)),
      'screenshot'  => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Screenshot'), 'required' => false)),
      'thumbnail'   => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Thumbnail'), 'required' => false)),
      'client'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Client'))),
      'client_2'    => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Client2'), 'required' => false)),
      'client_3'    => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Client3'), 'required' => false)),
      'is_featured' => new sfValidatorBoolean(array('required' => false)),
      'is_active'   => new sfValidatorBoolean(array('required' => false)),
      'position'    => new sfValidatorInteger(array('required' => false)),
        'tags_list'   => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'DmTag', 'required' => false)),
      ));

    /*
     * Embed Media form for screenshot
     */
    $this->embedForm('screenshot_form', $this->createMediaFormForScreenshot());
    unset($this['screenshot']);

    /*
     * Embed Media form for thumbnail
     */
    $this->embedForm('thumbnail_form', $this->createMediaFormForThumbnail());
    unset($this['thumbnail']);

    $this->widgetSchema->setNameFormat('project[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
    
    // Unset automatic fields like 'created_at', 'updated_at', 'position'
    // override this method in your form to keep them
    parent::unsetAutoFields();
  }

  /**
   * Creates a DmMediaForm instance for screenshot
   *
   * @return DmMediaForm a form instance for the related media
   */
  protected function createMediaFormForScreenshot()
  {
    return DmMediaForRecordForm::factory($this->object, 'screenshot', 'Screenshot', $this->validatorSchema['screenshot']->getOption('required'));
  }
  /**
   * Creates a DmMediaForm instance for thumbnail
   *
   * @return DmMediaForm a form instance for the related media
   */
  protected function createMediaFormForThumbnail()
  {
    return DmMediaForRecordForm::factory($this->object, 'thumbnail', 'Thumbnail', $this->validatorSchema['thumbnail']->getOption('required'));
  }

  protected function doBind(array $values)
  {
    $values = $this->filterValuesByEmbeddedMediaForm($values, 'screenshot');
    $values = $this->filterValuesByEmbeddedMediaForm($values, 'thumbnail');
    parent::doBind($values);
  }
  
  public function processValues($values)
  {
    $values = parent::processValues($values);
    $values = $this->processValuesForEmbeddedMediaForm($values, 'screenshot');
    $values = $this->processValuesForEmbeddedMediaForm($values, 'thumbnail');
    return $values;
  }
  
  protected function doUpdateObject($values)
  {
    parent::doUpdateObject($values);
    $this->doUpdateObjectForEmbeddedMediaForm($values, 'screenshot', 'Screenshot');
    $this->doUpdateObjectForEmbeddedMediaForm($values, 'thumbnail', 'Thumbnail');
  }

  public function getModelName()
  {
    return 'Project';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['tags_list']))
    {
      $this->setDefault('tags_list', $this->object->Tags->getPrimaryKeys());
    }

    if (isset($this->widgetSchema['medias_list']))
    {
      $this->setDefault('medias_list', $this->object->Medias->getPrimaryKeys());
    }

  }

  protected function doSave($con = null)
  {
    $this->saveTagsList($con);
    $this->saveMediasList($con);

    parent::doSave($con);
  }

  public function saveTagsList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['tags_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Tags->getPrimaryKeys();
    $values = $this->getValue('tags_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Tags', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Tags', array_values($link));
    }
  }

  public function saveMediasList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['medias_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Medias->getPrimaryKeys();
    $values = $this->getValue('medias_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Medias', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Medias', array_values($link));
    }
  }

}