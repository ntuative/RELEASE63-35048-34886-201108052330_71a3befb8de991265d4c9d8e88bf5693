package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
      
      public static const const_112:int = 1;
      
      public static const const_76:int = 2;
       
      
      private var var_1242:int;
      
      private var _furniId:int;
      
      private var var_2558:int;
      
      private var var_2274:String;
      
      private var var_1864:int;
      
      private var var_2405:int;
      
      private var var_2559:int;
      
      private var var_434:int;
      
      private var var_2557:int = -1;
      
      private var var_1863:int;
      
      private var var_49:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this.var_1242 = param1;
         this._furniId = param2;
         this.var_2558 = param3;
         this.var_2274 = param4;
         this.var_1864 = param5;
         this.var_434 = param6;
         this.var_2405 = param7;
         this.var_1863 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_49)
         {
            this.var_49.dispose();
            this.var_49 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2558;
      }
      
      public function get stuffData() : String
      {
         return this.var_2274;
      }
      
      public function get price() : int
      {
         return this.var_1864;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2405;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_49 != null)
         {
            this.var_49.dispose();
         }
         this.var_49 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2559 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2559;
      }
      
      public function get status() : int
      {
         return this.var_434;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2557;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2557 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1864 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1242 = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1863;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1863 = param1;
      }
   }
}
