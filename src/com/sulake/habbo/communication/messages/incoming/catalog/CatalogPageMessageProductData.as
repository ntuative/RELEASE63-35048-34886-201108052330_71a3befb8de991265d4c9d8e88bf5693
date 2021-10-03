package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_71:String = "s";
      
      public static const const_192:String = "e";
       
      
      private var var_1638:String;
      
      private var var_3008:int;
      
      private var var_1089:String;
      
      private var var_1639:int;
      
      private var var_2073:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1638 = param1.readString();
         this.var_3008 = param1.readInteger();
         this.var_1089 = param1.readString();
         this.var_1639 = param1.readInteger();
         this.var_2073 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1638;
      }
      
      public function get furniClassId() : int
      {
         return this.var_3008;
      }
      
      public function get extraParam() : String
      {
         return this.var_1089;
      }
      
      public function get productCount() : int
      {
         return this.var_1639;
      }
      
      public function get expiration() : int
      {
         return this.var_2073;
      }
   }
}
