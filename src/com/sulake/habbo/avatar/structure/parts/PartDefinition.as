package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2975:String;
      
      private var var_2159:String;
      
      private var var_2976:String;
      
      private var var_2158:Boolean;
      
      private var var_2160:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2975 = String(param1["set-type"]);
         this.var_2159 = String(param1["flipped-set-type"]);
         this.var_2976 = String(param1["remove-set-type"]);
         this.var_2158 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_2160 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_2160;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_2160 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2975;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_2159;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2976;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_2158;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_2158 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_2159 = param1;
      }
   }
}
