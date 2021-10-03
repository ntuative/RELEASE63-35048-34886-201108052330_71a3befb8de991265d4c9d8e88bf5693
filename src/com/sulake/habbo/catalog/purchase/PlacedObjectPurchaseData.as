package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class PlacedObjectPurchaseData implements IDisposable
   {
       
      
      private var var_1172:Boolean = false;
      
      private var var_238:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_2030:String = "";
      
      private var _x:int = 0;
      
      private var var_180:int = 0;
      
      private var _direction:int = 0;
      
      private var var_1242:int;
      
      private var var_2029:int;
      
      private var var_2072:IProductData;
      
      private var var_674:IFurnitureData;
      
      private var var_1516:String;
      
      public function PlacedObjectPurchaseData(param1:int, param2:int, param3:int, param4:int, param5:String, param6:int, param7:int, param8:int, param9:IPurchasableOffer)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_238 = param3;
         this._category = param4;
         this.var_2030 = param5;
         this._x = param6;
         this.var_180 = param7;
         this._direction = param8;
         this.setOfferData(param9);
      }
      
      public function dispose() : void
      {
         this.var_1172 = true;
         this.var_2072 = null;
         this.var_674 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1172;
      }
      
      private function setOfferData(param1:IPurchasableOffer) : void
      {
         this.var_1242 = param1.offerId;
         this.var_2029 = param1.productContainer.firstProduct.productClassId;
         this.var_2072 = param1.productContainer.firstProduct.productData;
         this.var_674 = param1.productContainer.firstProduct.furnitureData;
         this.var_1516 = param1.productContainer.firstProduct.extraParam;
      }
      
      public function toString() : String
      {
         return [this._roomCategory,this._roomId,this.var_238,this._category,this.var_2030,this._x,this.var_180,this._direction,this.var_1242,this.var_2029].toString();
      }
      
      public function get objectId() : int
      {
         return this.var_238;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get wallLocation() : String
      {
         return this.var_2030;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_180;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function get productClassId() : int
      {
         return this.var_2029;
      }
      
      public function get extraParameter() : String
      {
         return this.var_1516;
      }
      
      public function get furniData() : IFurnitureData
      {
         return this.var_674;
      }
   }
}
