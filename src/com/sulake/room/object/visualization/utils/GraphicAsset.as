package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2397:String;
      
      private var var_2620:String;
      
      private var var_457:BitmapDataAsset;
      
      private var var_1466:Boolean;
      
      private var var_1467:Boolean;
      
      private var var_2619:Boolean;
      
      private var _offsetX:int;
      
      private var var_1292:int;
      
      private var var_230:int;
      
      private var _height:int;
      
      private var var_886:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2397 = param1;
         this.var_2620 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_457 = _loc9_;
            this.var_886 = false;
         }
         else
         {
            this.var_457 = null;
            this.var_886 = true;
         }
         this.var_1466 = param4;
         this.var_1467 = param5;
         this._offsetX = param6;
         this.var_1292 = param7;
         this.var_2619 = param8;
      }
      
      public function dispose() : void
      {
         this.var_457 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_886 && this.var_457 != null)
         {
            _loc1_ = this.var_457.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_230 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_886 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1467;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1466;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_230;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2397;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2620;
      }
      
      public function get asset() : IAsset
      {
         return this.var_457;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2619;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1466)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1467)
         {
            return this.var_1292;
         }
         return -(this.height + this.var_1292);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1292;
      }
   }
}
