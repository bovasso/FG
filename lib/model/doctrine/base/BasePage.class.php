<?php

/**
 * BasePage
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $title
 * @property clob $body
 * @property integer $photo
 * @property boolean $is_active
 * @property DmMedia $Photo
 * 
 * @method string  getTitle()     Returns the current record's "title" value
 * @method clob    getBody()      Returns the current record's "body" value
 * @method integer getPhoto()     Returns the current record's "photo" value
 * @method boolean getIsActive()  Returns the current record's "is_active" value
 * @method DmMedia getPhoto()     Returns the current record's "Photo" value
 * @method Page    setTitle()     Sets the current record's "title" value
 * @method Page    setBody()      Sets the current record's "body" value
 * @method Page    setPhoto()     Sets the current record's "photo" value
 * @method Page    setIsActive()  Sets the current record's "is_active" value
 * @method Page    setPhoto()     Sets the current record's "Photo" value
 * 
 * @package    Funny Garbgage
 * @subpackage model
 * @author     Anthony Bovasso
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BasePage extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('page');
        $this->hasColumn('title', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('body', 'clob', null, array(
             'type' => 'clob',
             'extra' => 'markdown',
             ));
        $this->hasColumn('photo', 'integer', null, array(
             'type' => 'integer',
             ));
        $this->hasColumn('is_active', 'boolean', null, array(
             'type' => 'boolean',
             'notnull' => true,
             'default' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmMedia as Photo', array(
             'local' => 'photo',
             'foreign' => 'id'));

        $dmsortable0 = new Doctrine_Template_DmSortable();
        $timestampable0 = new Doctrine_Template_Timestampable();
        $dmtaggable0 = new Doctrine_Template_DmTaggable();
        $this->actAs($dmsortable0);
        $this->actAs($timestampable0);
        $this->actAs($dmtaggable0);
    }
}