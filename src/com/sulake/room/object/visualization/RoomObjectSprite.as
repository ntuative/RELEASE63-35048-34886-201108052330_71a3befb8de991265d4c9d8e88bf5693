package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1231:int = 0;
       
      
      private var var_457:BitmapData = null;
      
      private var var_2397:String = "";
      
      private var var_321:Boolean = true;
      
      private var var_2537:String = "";
      
      private var var_2536:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1921:String;
      
      private var var_1466:Boolean = false;
      
      private var var_1467:Boolean = false;
      
      private var _offset:Point;
      
      private var var_230:int = 0;
      
      private var _height:int = 0;
      
      private var var_1356:Number = 0;
      
      private var var_2651:Boolean = false;
      
      private var var_2649:Boolean = true;
      
      private var var_2494:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2484:int = 0;
      
      private var var_2650:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_1921 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2484 = var_1231++;
      }
      
      public function dispose() : void
      {
         this.var_457 = null;
         this.var_230 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_457;
      }
      
      public function get assetName() : String
      {
         return this.var_2397;
      }
      
      public function get visible() : Boolean
      {
         return this.var_321;
      }
      
      public function get tag() : String
      {
         return this.var_2537;
      }
      
      public function get alpha() : int
      {
         return this.var_2536;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_1921;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1467;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1466;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_230;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1356;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2651;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2649;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2494;
      }
      
      public function get instanceId() : int
      {
         return this.var_2484;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2650;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_230 = param1.width;
            this._height = param1.height;
         }
         this.var_457 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2397 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_321 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2537 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2536 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_1921 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2650 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1466 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1467 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1356 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2651 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2649 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2494 = param1;
         ++this._updateID;
      }
   }
}
