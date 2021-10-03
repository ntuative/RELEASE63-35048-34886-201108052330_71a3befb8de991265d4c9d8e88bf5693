package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2770:Number = 0.0;
      
      private var var_2769:Number = 0.0;
      
      private var var_2807:Number = 0.0;
      
      private var var_2808:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2770 = param1;
         this.var_2769 = param2;
         this.var_2807 = param3;
         this.var_2808 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2770;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2769;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2807;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2808;
      }
   }
}
