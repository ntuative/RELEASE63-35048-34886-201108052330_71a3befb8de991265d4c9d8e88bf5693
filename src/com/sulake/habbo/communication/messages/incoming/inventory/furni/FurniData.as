package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2709:int;
      
      private var var_1531:String;
      
      private var _objId:int;
      
      private var var_1859:int;
      
      private var _category:int;
      
      private var var_2274:String;
      
      private var var_2711:Boolean;
      
      private var var_2708:Boolean;
      
      private var var_2710:Boolean;
      
      private var var_2304:Boolean;
      
      private var var_2352:int;
      
      private var var_1907:int;
      
      private var var_1836:String = "";
      
      private var var_1559:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2709 = param1;
         this.var_1531 = param2;
         this._objId = param3;
         this.var_1859 = param4;
         this._category = param5;
         this.var_2274 = param6;
         this.var_2711 = param7;
         this.var_2708 = param8;
         this.var_2710 = param9;
         this.var_2304 = param10;
         this.var_2352 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1836 = param1;
         this.var_1907 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2709;
      }
      
      public function get itemType() : String
      {
         return this.var_1531;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1859;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2274;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2711;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2708;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2710;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2304;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2352;
      }
      
      public function get slotId() : String
      {
         return this.var_1836;
      }
      
      public function get songId() : int
      {
         return this.var_1559;
      }
      
      public function get extra() : int
      {
         return this.var_1907;
      }
   }
}
