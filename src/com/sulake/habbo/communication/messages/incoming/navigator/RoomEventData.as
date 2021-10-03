package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_2205:Boolean;
      
      private var var_3034:int;
      
      private var var_3036:String;
      
      private var var_396:int;
      
      private var var_3038:int;
      
      private var var_1984:String;
      
      private var var_3037:String;
      
      private var var_3035:String;
      
      private var var_956:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_956 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_2205 = false;
            return;
         }
         this.var_2205 = true;
         this.var_3034 = int(_loc2_);
         this.var_3036 = param1.readString();
         this.var_396 = int(param1.readString());
         this.var_3038 = param1.readInteger();
         this.var_1984 = param1.readString();
         this.var_3037 = param1.readString();
         this.var_3035 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_956.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_956 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_3034;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_3036;
      }
      
      public function get flatId() : int
      {
         return this.var_396;
      }
      
      public function get eventType() : int
      {
         return this.var_3038;
      }
      
      public function get eventName() : String
      {
         return this.var_1984;
      }
      
      public function get eventDescription() : String
      {
         return this.var_3037;
      }
      
      public function get creationTime() : String
      {
         return this.var_3035;
      }
      
      public function get tags() : Array
      {
         return this.var_956;
      }
      
      public function get exists() : Boolean
      {
         return this.var_2205;
      }
   }
}
