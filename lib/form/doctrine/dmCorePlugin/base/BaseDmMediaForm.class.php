<?php

/**
 * DmMedia form base class.
 *
 * @method DmMedia getObject() Returns the current form's model object
 *
 * @package    Funny Garbgage
 * @subpackage form
 * @author     Anthony Bovasso
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseDmMediaForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'                 => new sfWidgetFormInputHidden(),
      'dm_media_folder_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Folder'), 'add_empty' => false)),
      'file'               => new sfWidgetFormInputText(),
      'legend'             => new sfWidgetFormInputText(),
      'author'             => new sfWidgetFormInputText(),
      'license'            => new sfWidgetFormInputText(),
      'mime'               => new sfWidgetFormInputText(),
      'size'               => new sfWidgetFormInputText(),
      'dimensions'         => new sfWidgetFormInputText(),
      'created_at'         => new sfWidgetFormDateTime(),
      'updated_at'         => new sfWidgetFormDateTime(),
      'project_list'       => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Project')),
    ));

    $this->setValidators(array(
      'id'                 => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'dm_media_folder_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Folder'))),
      'file'               => new sfValidatorString(array('max_length' => 255)),
      'legend'             => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'author'             => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'license'            => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'mime'               => new sfValidatorString(array('max_length' => 63)),
      'size'               => new sfValidatorInteger(array('required' => false)),
      'dimensions'         => new sfValidatorString(array('max_length' => 15, 'required' => false)),
      'created_at'         => new sfValidatorDateTime(),
      'updated_at'         => new sfValidatorDateTime(),
      'project_list'       => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Project', 'required' => false)),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'DmMedia', 'column' => array('dm_media_folder_id', 'file')))
    );

    $this->widgetSchema->setNameFormat('dm_media[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'DmMedia';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['project_list']))
    {
      $this->setDefault('project_list', $this->object->Project->getPrimaryKeys());
    }

  }

  protected function doSave($con = null)
  {
    $this->saveProjectList($con);

    parent::doSave($con);
  }

  public function saveProjectList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['project_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Project->getPrimaryKeys();
    $values = $this->getValue('project_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Project', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Project', array_values($link));
    }
  }

}
