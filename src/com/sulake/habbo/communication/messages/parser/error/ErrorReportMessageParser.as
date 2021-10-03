package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1895:int;
      
      private var var_1992:int;
      
      private var var_1993:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1992 = param1.readInteger();
         this.var_1895 = param1.readInteger();
         this.var_1993 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1895 = 0;
         this.var_1992 = 0;
         this.var_1993 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1895;
      }
      
      public function get messageId() : int
      {
         return this.var_1992;
      }
      
      public function get timestamp() : String
      {
         return this.var_1993;
      }
   }
}
