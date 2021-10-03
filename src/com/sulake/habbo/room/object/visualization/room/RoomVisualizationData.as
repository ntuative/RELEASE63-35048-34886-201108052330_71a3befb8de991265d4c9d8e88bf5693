package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_602:WallRasterizer;
      
      private var var_603:FloorRasterizer;
      
      private var var_919:WallAdRasterizer;
      
      private var var_604:LandscapeRasterizer;
      
      private var var_918:PlaneMaskManager;
      
      private var var_886:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_602 = new WallRasterizer();
         this.var_603 = new FloorRasterizer();
         this.var_919 = new WallAdRasterizer();
         this.var_604 = new LandscapeRasterizer();
         this.var_918 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_886;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_603;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_602;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_919;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_604;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_918;
      }
      
      public function dispose() : void
      {
         if(this.var_602 != null)
         {
            this.var_602.dispose();
            this.var_602 = null;
         }
         if(this.var_603 != null)
         {
            this.var_603.dispose();
            this.var_603 = null;
         }
         if(this.var_919 != null)
         {
            this.var_919.dispose();
            this.var_919 = null;
         }
         if(this.var_604 != null)
         {
            this.var_604.dispose();
            this.var_604 = null;
         }
         if(this.var_918 != null)
         {
            this.var_918.dispose();
            this.var_918 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_602 != null)
         {
            this.var_602.clearCache();
         }
         if(this.var_603 != null)
         {
            this.var_603.clearCache();
         }
         if(this.var_604 != null)
         {
            this.var_604.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_602.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_603.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_919.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_604.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_918.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_886)
         {
            return;
         }
         this.var_602.initializeAssetCollection(param1);
         this.var_603.initializeAssetCollection(param1);
         this.var_919.initializeAssetCollection(param1);
         this.var_604.initializeAssetCollection(param1);
         this.var_918.initializeAssetCollection(param1);
         this.var_886 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
