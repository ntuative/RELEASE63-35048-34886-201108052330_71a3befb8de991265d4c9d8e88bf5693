package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_2116:int = 0;
      
      private var var_2115:int = 0;
      
      private var var_2228:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_2116;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_2115;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2228;
      }
      
      public function flush() : Boolean
      {
         this.var_2116 = 0;
         this.var_2115 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2116 = param1.readInteger();
         this.var_2115 = param1.readInteger();
         this.var_2228 = param1.readInteger();
         return true;
      }
   }
}
