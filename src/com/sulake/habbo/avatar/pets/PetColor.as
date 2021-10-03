package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var _rgb:uint;
      
      private var var_2002:uint;
      
      private var var_2001:uint;
      
      private var _b:uint;
      
      private var var_773:ColorTransform;
      
      private var var_2176:Number;
      
      private var var_2177:Number;
      
      private var var_2178:Number;
      
      private var var_2754:int;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_2002 = this._rgb >> 16 & 255;
         this.var_2001 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_2176 = this.var_2002 / 255 * 1;
         this.var_2177 = this.var_2001 / 255 * 1;
         this.var_2178 = this._b / 255 * 1;
         this.var_773 = new ColorTransform(this.var_2176,this.var_2177,this.var_2178);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_2002;
      }
      
      public function get g() : uint
      {
         return this.var_2001;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_773;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return this.var_2754;
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         this.var_2754 = param1;
      }
   }
}
