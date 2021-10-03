package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteQuestionMessageParser implements IMessageParser
   {
       
      
      private var var_1372:String;
      
      private var var_1468:Array;
      
      public function VoteQuestionMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1372;
      }
      
      public function get choices() : Array
      {
         return this.var_1468.slice();
      }
      
      public function flush() : Boolean
      {
         this.var_1372 = "";
         this.var_1468 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1372 = param1.readString();
         this.var_1468 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1468.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
   }
}
