package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1806:int = 0;
      
      private var var_1530:Dictionary;
      
      private var var_1856:int = 0;
      
      private var var_1857:int = 0;
      
      private var var_2479:Boolean = false;
      
      private var var_2472:int = 0;
      
      private var var_2475:int = 0;
      
      private var var_2543:Boolean = false;
      
      public function Purse()
      {
         this.var_1530 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1806;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1806 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1856;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1856 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1857;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1857 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1856 > 0 || this.var_1857 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2479;
      }
      
      public function get isExpiring() : Boolean
      {
         return this.var_2543;
      }
      
      public function set isExpiring(param1:Boolean) : void
      {
         this.var_2543 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2479 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2472;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2472 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2475;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2475 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1530;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1530 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1530[param1];
      }
   }
}
