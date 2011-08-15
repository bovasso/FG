<?php


class StaffMemberTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('StaffMember');
    }
}