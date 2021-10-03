package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FriendNotificationMessageParser implements IMessageParser
   {
       
      
      private var var_2859:int = -1;
      
      private var var_2332:String;
      
      private var _message:String;
      
      public function FriendNotificationMessageParser()
      {
         super();
      }
      
      public function get typeCode() : int
      {
         return this.var_2859;
      }
      
      public function get avatarId() : String
      {
         return this.var_2332;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2332 = param1.readString();
         this.var_2859 = param1.readInteger();
         this._message = param1.readString();
         return true;
      }
   }
}
