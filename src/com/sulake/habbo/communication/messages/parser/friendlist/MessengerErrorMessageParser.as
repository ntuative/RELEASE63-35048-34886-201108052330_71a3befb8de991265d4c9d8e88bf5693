package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MessengerErrorMessageParser implements IMessageParser
   {
       
      
      private var var_2391:int;
      
      private var var_1895:int;
      
      public function MessengerErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2391 = param1.readInteger();
         this.var_1895 = param1.readInteger();
         return true;
      }
      
      public function get clientMessageId() : int
      {
         return this.var_2391;
      }
      
      public function get errorCode() : int
      {
         return this.var_1895;
      }
   }
}
