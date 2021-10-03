package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_737:String = "";
      
      public static const const_438:int = 0;
      
      public static const const_661:int = 255;
      
      public static const const_974:Boolean = false;
      
      public static const const_648:int = 0;
      
      public static const const_635:int = 0;
      
      public static const const_461:int = 0;
      
      public static const const_1265:int = 1;
      
      public static const const_1179:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2537:String = "";
      
      private var var_1780:int = 0;
      
      private var var_2536:int = 255;
      
      private var var_2539:Boolean = false;
      
      private var var_2534:int = 0;
      
      private var var_2538:int = 0;
      
      private var var_2535:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2537 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2537;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1780 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1780;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2536 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2536;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2539 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2539;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2534 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2534;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2538 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2538;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2535 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2535;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
