package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1817:String = "pricing_model_unknown";
      
      public static const const_426:String = "pricing_model_single";
      
      public static const const_436:String = "pricing_model_multi";
      
      public static const const_624:String = "pricing_model_bundle";
      
      public static const const_1839:String = "price_type_none";
      
      public static const const_809:String = "price_type_credits";
      
      public static const const_1311:String = "price_type_activitypoints";
      
      public static const const_1246:String = "price_type_credits_and_activitypoints";
       
      
      private var var_942:String;
      
      private var var_1424:String;
      
      private var var_1242:int;
      
      private var var_2227:String;
      
      private var var_1422:int;
      
      private var var_1423:int;
      
      private var var_2228:int;
      
      private var var_248:ICatalogPage;
      
      private var var_756:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var _clubLevel:int = 0;
      
      private var var_3071:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1242 = param1;
         this.var_2227 = param2;
         this.var_1422 = param3;
         this.var_1423 = param4;
         this.var_2228 = param5;
         this.var_248 = param8;
         this._clubLevel = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_248;
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function get localizationId() : String
      {
         return this.var_2227;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1422;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1423;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2228;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_756;
      }
      
      public function get pricingModel() : String
      {
         return this.var_942;
      }
      
      public function get priceType() : String
      {
         return this.var_1424;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_3071;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_3071 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1242 = 0;
         this.var_2227 = "";
         this.var_1422 = 0;
         this.var_1423 = 0;
         this.var_2228 = 0;
         this.var_248 = null;
         if(this.var_756 != null)
         {
            this.var_756.dispose();
            this.var_756 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_942)
         {
            case const_426:
               this.var_756 = new SingleProductContainer(this,param1);
               break;
            case const_436:
               this.var_756 = new MultiProductContainer(this,param1);
               break;
            case const_624:
               this.var_756 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_942);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_942 = const_426;
            }
            else
            {
               this.var_942 = const_436;
            }
         }
         else if(param1.length > 1)
         {
            this.var_942 = const_624;
         }
         else
         {
            this.var_942 = const_1817;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1422 > 0 && this.var_1423 > 0)
         {
            this.var_1424 = const_1246;
         }
         else if(this.var_1422 > 0)
         {
            this.var_1424 = const_809;
         }
         else if(this.var_1423 > 0)
         {
            this.var_1424 = const_1311;
         }
         else
         {
            this.var_1424 = const_1839;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_248.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_756.products)
         {
            _loc4_ = this.var_248.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
