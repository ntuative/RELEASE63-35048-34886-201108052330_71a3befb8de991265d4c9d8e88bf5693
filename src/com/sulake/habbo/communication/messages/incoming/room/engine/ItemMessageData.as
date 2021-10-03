package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2563:Boolean = false;
      
      private var var_2567:int = 0;
      
      private var var_2566:int = 0;
      
      private var var_2564:int = 0;
      
      private var var_2565:int = 0;
      
      private var var_180:Number = 0;
      
      private var var_181:Number = 0;
      
      private var var_485:String = "";
      
      private var _type:int = 0;
      
      private var var_3139:String = "";
      
      private var var_1907:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_196:Boolean = false;
      
      private var var_2351:Boolean;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2563 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_196 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2563;
      }
      
      public function get wallX() : Number
      {
         return this.var_2567;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_2567 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2566;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_2566 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2564;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_2564 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2565;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_2565 = param1;
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
      
      public function get dir() : String
      {
         return this.var_485;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_485 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_196)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_196)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_196)
         {
            this._data = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2351;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         if(!this.var_196)
         {
            this.var_2351 = param1;
         }
      }
   }
}
