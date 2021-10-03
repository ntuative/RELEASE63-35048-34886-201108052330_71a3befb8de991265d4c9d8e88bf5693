package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_180:Number = 0;
      
      private var var_181:Number = 0;
      
      private var var_2378:Number = 0;
      
      private var var_2379:Number = 0;
      
      private var var_2382:Number = 0;
      
      private var var_2380:Number = 0;
      
      private var var_485:int = 0;
      
      private var var_2377:int = 0;
      
      private var var_365:Array;
      
      private var var_2381:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_365 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_180 = param3;
         this.var_181 = param4;
         this.var_2378 = param5;
         this.var_485 = param6;
         this.var_2377 = param7;
         this.var_2379 = param8;
         this.var_2382 = param9;
         this.var_2380 = param10;
         this.var_2381 = param11;
         this.var_365 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_180;
      }
      
      public function get z() : Number
      {
         return this.var_181;
      }
      
      public function get localZ() : Number
      {
         return this.var_2378;
      }
      
      public function get targetX() : Number
      {
         return this.var_2379;
      }
      
      public function get targetY() : Number
      {
         return this.var_2382;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2380;
      }
      
      public function get dir() : int
      {
         return this.var_485;
      }
      
      public function get dirHead() : int
      {
         return this.var_2377;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2381;
      }
      
      public function get actions() : Array
      {
         return this.var_365.slice();
      }
   }
}
