package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1305:String = "M";
      
      public static const const_2033:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_180:Number = 0;
      
      private var var_181:Number = 0;
      
      private var var_485:int = 0;
      
      private var _name:String = "";
      
      private var var_1723:int = 0;
      
      private var var_1106:String = "";
      
      private var _figure:String = "";
      
      private var var_2532:String = "";
      
      private var var_2452:int;
      
      private var var_2454:int = 0;
      
      private var var_2530:String = "";
      
      private var var_2531:int = 0;
      
      private var var_2455:int = 0;
      
      private var var_2617:String = "";
      
      private var var_196:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_196 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_196)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_180;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_180 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_181;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_181 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_485;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_485 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_196)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1723;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_1723 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1106;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_1106 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_196)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2532;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_2532 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2452;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2452 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2454;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2454 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2530;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_2530 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2531;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2531 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2455;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2455 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2617;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_2617 = param1;
         }
      }
   }
}
