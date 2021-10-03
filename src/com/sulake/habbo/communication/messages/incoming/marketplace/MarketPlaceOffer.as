package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1242:int;
      
      private var _furniId:int;
      
      private var var_2558:int;
      
      private var var_2274:String;
      
      private var var_1864:int;
      
      private var var_434:int;
      
      private var var_2557:int = -1;
      
      private var var_2405:int;
      
      private var var_1863:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1242 = param1;
         this._furniId = param2;
         this.var_2558 = param3;
         this.var_2274 = param4;
         this.var_1864 = param5;
         this.var_434 = param6;
         this.var_2557 = param7;
         this.var_2405 = param8;
         this.var_1863 = param9;
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
      
      public function get status() : int
      {
         return this.var_434;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2557;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2405;
      }
      
      public function get offerCount() : int
      {
         return this.var_1863;
      }
   }
}
