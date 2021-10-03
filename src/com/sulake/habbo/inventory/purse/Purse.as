package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1856:int = 0;
      
      private var var_1857:int = 0;
      
      private var var_2767:int = 0;
      
      private var var_2768:Boolean = false;
      
      private var var_2479:Boolean = false;
      
      private var var_2543:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1856 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1857 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2767 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2768 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2479 = param1;
      }
      
      public function set clubIsExpiring(param1:Boolean) : void
      {
         this.var_2543 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1856;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1857;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2767;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2768;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2479;
      }
      
      public function get clubIsExpiring() : Boolean
      {
         return this.var_2543;
      }
   }
}
