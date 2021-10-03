package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2405:int;
      
      private var var_2404:int;
      
      private var var_2406:int;
      
      private var _dayOffsets:Array;
      
      private var var_1785:Array;
      
      private var var_1784:Array;
      
      private var var_2408:int;
      
      private var var_2407:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2405;
      }
      
      public function get offerCount() : int
      {
         return this.var_2404;
      }
      
      public function get historyLength() : int
      {
         return this.var_2406;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1785;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1784;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2408;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2407;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2405 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2404 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2406 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1785 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1784 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2408 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2407 = param1;
      }
   }
}
