package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1242:int;
      
      private var var_1858:String;
      
      private var var_1864:int;
      
      private var _upgrade:Boolean;
      
      private var var_2722:Boolean;
      
      private var var_2720:int;
      
      private var var_2723:int;
      
      private var var_248:ICatalogPage;
      
      private var var_2719:int;
      
      private var var_2724:int;
      
      private var var_2721:int;
      
      private var var_1516:String;
      
      private var var_2902:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this.var_1242 = param1;
         this.var_1858 = param2;
         this.var_1864 = param3;
         this._upgrade = param4;
         this.var_2722 = param5;
         this.var_2720 = param6;
         this.var_2723 = param7;
         this.var_2719 = param8;
         this.var_2724 = param9;
         this.var_2721 = param10;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_248 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get extraParameter() : String
      {
         return this.var_1516;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1516 = param1;
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function get productCode() : String
      {
         return this.var_1858;
      }
      
      public function get price() : int
      {
         return this.var_1864;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2722;
      }
      
      public function get periods() : int
      {
         return this.var_2720;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2723;
      }
      
      public function get year() : int
      {
         return this.var_2719;
      }
      
      public function get month() : int
      {
         return this.var_2724;
      }
      
      public function get day() : int
      {
         return this.var_2721;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return ActivityPointTypeEnum.PIXEL;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1864;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_248;
      }
      
      public function get priceType() : String
      {
         return Offer.const_809;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1858;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_248 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2902;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2902 = param1;
      }
   }
}
