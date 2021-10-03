package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_914:int = 1;
      
      public static const const_871:int = 2;
      
      public static const const_990:int = 3;
      
      public static const const_1262:int = 4;
      
      public static const const_754:int = 5;
      
      public static const const_1276:int = 6;
       
      
      private var _type:int;
      
      private var var_1220:int;
      
      private var var_2349:String;
      
      private var var_2350:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1220 = param2;
         this.var_2349 = param3;
         this.var_2350 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2349;
      }
      
      public function get time() : String
      {
         return this.var_2350;
      }
      
      public function get senderId() : int
      {
         return this.var_1220;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
