<?php


class AboutSlideshowTable extends myDoctrineTable
{
    
    public static function getInstance()
    {
        return Doctrine_Core::getTable('AboutSlideshow');
    }
}