<?php

/**
 * BaseDmLock
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $user_id
 * @property string $user_name
 * @property string $module
 * @property string $action
 * @property integer $record_id
 * @property integer $time
 * @property string $app
 * @property string $url
 * @property string $culture
 * @property DmUser $User
 * 
 * @method integer getUserId()    Returns the current record's "user_id" value
 * @method string  getUserName()  Returns the current record's "user_name" value
 * @method string  getModule()    Returns the current record's "module" value
 * @method string  getAction()    Returns the current record's "action" value
 * @method integer getRecordId()  Returns the current record's "record_id" value
 * @method integer getTime()      Returns the current record's "time" value
 * @method string  getApp()       Returns the current record's "app" value
 * @method string  getUrl()       Returns the current record's "url" value
 * @method string  getCulture()   Returns the current record's "culture" value
 * @method DmUser  getUser()      Returns the current record's "User" value
 * @method DmLock  setUserId()    Sets the current record's "user_id" value
 * @method DmLock  setUserName()  Sets the current record's "user_name" value
 * @method DmLock  setModule()    Sets the current record's "module" value
 * @method DmLock  setAction()    Sets the current record's "action" value
 * @method DmLock  setRecordId()  Sets the current record's "record_id" value
 * @method DmLock  setTime()      Sets the current record's "time" value
 * @method DmLock  setApp()       Sets the current record's "app" value
 * @method DmLock  setUrl()       Sets the current record's "url" value
 * @method DmLock  setCulture()   Sets the current record's "culture" value
 * @method DmLock  setUser()      Sets the current record's "User" value
 * 
 * @package    Funny Garbgage
 * @subpackage model
 * @author     Anthony Bovasso
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseDmLock extends myDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('dm_lock');
        $this->hasColumn('user_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('user_name', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('module', 'string', 127, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 127,
             ));
        $this->hasColumn('action', 'string', 127, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 127,
             ));
        $this->hasColumn('record_id', 'integer', null, array(
             'type' => 'integer',
             'unsigned' => true,
             'notnull' => true,
             'default' => 0,
             ));
        $this->hasColumn('time', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('app', 'string', 127, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 127,
             ));
        $this->hasColumn('url', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('culture', 'string', 15, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 15,
             ));


        $this->index('dmLockIndex', array(
             'fields' => 
             array(
              0 => 'user_id',
              1 => 'module',
              2 => 'action',
              3 => 'record_id',
             ),
             'type' => 'unique',
             ));
        $this->option('symfony', array(
             'form' => false,
             'filter' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('DmUser as User', array(
             'local' => 'user_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));
    }
}