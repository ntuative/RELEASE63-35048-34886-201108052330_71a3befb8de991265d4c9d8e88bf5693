package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1559:int;
      
      private var var_1877:Number;
      
      private var var_2599:Number;
      
      private var var_2598:int;
      
      private var var_2597:Number;
      
      private var var_2600:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1559 = param1;
         this.var_1877 = param2;
         this.var_2599 = param3;
         this.var_2597 = param4;
         this.var_2600 = param5;
         this.var_2598 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1559;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1877 < 0)
         {
            return 0;
         }
         return this.var_1877 + (getTimer() - this.var_2598) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2599;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2597;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2600;
      }
   }
}
