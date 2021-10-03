package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrameData
   {
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_180:int = 0;
      
      private var var_2614:int = 0;
      
      private var var_2613:int = 0;
      
      private var var_2615:int = 1;
      
      public function AnimationFrameData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_180 = param3;
         this.var_2614 = param4;
         this.var_2613 = param5;
         this.var_2615 = param6;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function hasDirectionalOffsets() : Boolean
      {
         return false;
      }
      
      public function getX(param1:int) : int
      {
         return this._x;
      }
      
      public function getY(param1:int) : int
      {
         return this.var_180;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this._x;
      }
      
      public function get randomX() : int
      {
         return this.var_2614;
      }
      
      public function get randomY() : int
      {
         return this.var_2613;
      }
      
      public function get repeats() : int
      {
         return this.var_2615;
      }
   }
}
