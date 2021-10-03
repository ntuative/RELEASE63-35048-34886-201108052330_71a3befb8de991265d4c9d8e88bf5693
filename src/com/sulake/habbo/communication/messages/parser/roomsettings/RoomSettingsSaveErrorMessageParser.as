package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2327:int = 1;
      
      public static const const_2261:int = 2;
      
      public static const const_2281:int = 3;
      
      public static const const_2282:int = 4;
      
      public static const const_1790:int = 5;
      
      public static const const_2240:int = 6;
      
      public static const const_2060:int = 7;
      
      public static const const_2039:int = 8;
      
      public static const const_2179:int = 9;
      
      public static const const_1940:int = 10;
      
      public static const const_1799:int = 11;
      
      public static const const_2002:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1895:int;
      
      private var var_647:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1895 = param1.readInteger();
         this.var_647 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1895;
      }
      
      public function get info() : String
      {
         return this.var_647;
      }
   }
}
