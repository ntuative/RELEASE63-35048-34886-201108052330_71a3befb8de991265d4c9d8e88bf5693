package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2626:int;
      
      private var var_1531:String;
      
      private var var_2627:int;
      
      private var var_2629:int;
      
      private var _category:int;
      
      private var var_2274:String;
      
      private var var_1907:int;
      
      private var var_2632:int;
      
      private var var_2631:int;
      
      private var var_2628:int;
      
      private var var_2630:int;
      
      private var var_2633:Boolean;
      
      private var var_3146:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2626 = param1;
         this.var_1531 = param2;
         this.var_2627 = param3;
         this.var_2629 = param4;
         this._category = param5;
         this.var_2274 = param6;
         this.var_1907 = param7;
         this.var_2632 = param8;
         this.var_2631 = param9;
         this.var_2628 = param10;
         this.var_2630 = param11;
         this.var_2633 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2626;
      }
      
      public function get itemType() : String
      {
         return this.var_1531;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2627;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2629;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2274;
      }
      
      public function get extra() : int
      {
         return this.var_1907;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2632;
      }
      
      public function get creationDay() : int
      {
         return this.var_2631;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2628;
      }
      
      public function get creationYear() : int
      {
         return this.var_2630;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2633;
      }
      
      public function get songID() : int
      {
         return this.var_1907;
      }
   }
}
