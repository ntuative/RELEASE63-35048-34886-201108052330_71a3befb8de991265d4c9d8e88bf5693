package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1509:Boolean = false;
      
      private var var_1864:int;
      
      private var var_1846:Array;
      
      private var var_820:Array;
      
      private var var_822:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1509 = _loc2_.isWrappingEnabled;
         this.var_1864 = _loc2_.wrappingPrice;
         this.var_1846 = _loc2_.stuffTypes;
         this.var_820 = _loc2_.boxTypes;
         this.var_822 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1509;
      }
      
      public function get price() : int
      {
         return this.var_1864;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1846;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_820;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_822;
      }
   }
}
