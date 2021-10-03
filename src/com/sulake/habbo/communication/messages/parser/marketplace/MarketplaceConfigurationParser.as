package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1509:Boolean;
      
      private var var_2320:int;
      
      private var var_1743:int;
      
      private var var_1744:int;
      
      private var var_2318:int;
      
      private var var_2319:int;
      
      private var var_2316:int;
      
      private var var_2314:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1509;
      }
      
      public function get commission() : int
      {
         return this.var_2320;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1743;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1744;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2319;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2318;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2316;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2314;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1509 = param1.readBoolean();
         this.var_2320 = param1.readInteger();
         this.var_1743 = param1.readInteger();
         this.var_1744 = param1.readInteger();
         this.var_2319 = param1.readInteger();
         this.var_2318 = param1.readInteger();
         this.var_2316 = param1.readInteger();
         this.var_2314 = param1.readInteger();
         return true;
      }
   }
}
