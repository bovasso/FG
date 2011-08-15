<?php


class JobPositionTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('JobPosition');
    }
}