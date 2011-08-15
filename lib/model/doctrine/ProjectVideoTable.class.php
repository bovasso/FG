<?php


class ProjectVideoTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('ProjectVideo');
    }
}