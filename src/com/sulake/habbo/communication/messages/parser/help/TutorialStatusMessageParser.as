package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1373:Boolean;
      
      private var var_1374:Boolean;
      
      private var var_1666:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1373;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1374;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1666;
      }
      
      public function flush() : Boolean
      {
         this.var_1373 = false;
         this.var_1374 = false;
         this.var_1666 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1373 = param1.readBoolean();
         this.var_1374 = param1.readBoolean();
         this.var_1666 = param1.readBoolean();
         return true;
      }
   }
}
