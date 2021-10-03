package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.geom.Point;
   
   public class RoomWallData
   {
      
      public static var var_431:Array = [];
      
      public static var var_513:Array = [];
      
      {
         var_431.push(new Vector3d(1,0,0));
         var_431.push(new Vector3d(0,1,0));
         var_431.push(new Vector3d(-1,0,0));
         var_431.push(new Vector3d(0,-1,0));
         var_513.push(new Vector3d(0,1,0));
         var_513.push(new Vector3d(-1,0,0));
         var_513.push(new Vector3d(0,-1,0));
         var_513.push(new Vector3d(1,0,0));
      }
      
      private var var_1395:Array;
      
      private var var_1394:Array;
      
      private var var_294:Array;
      
      private var var_744:Array;
      
      private var var_2183:Array;
      
      private var _borders:Array;
      
      private var _hideWalls:Array;
      
      private var _manuallyLeftCut:Array;
      
      private var _manuallyRightCut:Array;
      
      private var var_2184:int = 0;
      
      public function RoomWallData()
      {
         this.var_1395 = [];
         this.var_1394 = [];
         this.var_294 = [];
         this.var_744 = [];
         this.var_2183 = [];
         this._borders = [];
         this._hideWalls = [];
         this._manuallyLeftCut = [];
         this._manuallyRightCut = [];
         super();
      }
      
      public function addWall(param1:Point, param2:int, param3:int, param4:Boolean, param5:Boolean) : void
      {
         this.var_1395.push(param1);
         this.var_294.push(param2);
         this.var_744.push(param3);
         this._borders.push(param4);
         this.var_2183.push(param5);
         this._hideWalls.push(false);
         this._manuallyLeftCut.push(false);
         this._manuallyRightCut.push(false);
         ++this.var_2184;
      }
      
      public function get count() : int
      {
         return this.var_2184;
      }
      
      public function getCorner(param1:int) : Point
      {
         return this.var_1395[param1];
      }
      
      public function getEndPoint(param1:int) : Point
      {
         this.calculateWallEndPoints();
         return this.var_1394[param1];
      }
      
      public function getLength(param1:int) : int
      {
         return this.var_744[param1];
      }
      
      public function getDirection(param1:int) : int
      {
         return this.var_294[param1];
      }
      
      public function getBorder(param1:int) : Boolean
      {
         return this._borders[param1];
      }
      
      public function getHideWall(param1:int) : Boolean
      {
         return this._hideWalls[param1];
      }
      
      public function getLeftTurn(param1:int) : Boolean
      {
         return this.var_2183[param1];
      }
      
      public function getManuallyLeftCut(param1:int) : Boolean
      {
         return this._manuallyLeftCut[param1];
      }
      
      public function getManuallyRightCut(param1:int) : Boolean
      {
         return this._manuallyRightCut[param1];
      }
      
      public function setHideWall(param1:int, param2:Boolean) : void
      {
         this._hideWalls[param1] = param2;
      }
      
      public function setLength(param1:int, param2:int) : void
      {
         if(param2 < this.var_744[param1])
         {
            this.var_744[param1] = param2;
            this._manuallyRightCut[param1] = true;
         }
      }
      
      public function moveCorner(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         if(param2 > 0 && param2 < this.var_744[param1])
         {
            _loc3_ = var_431[this.getDirection(param1)];
            this.var_1395[param1] = this.var_1395[param1].add(new Point(param2 * _loc3_.x,param2 * _loc3_.y));
            this.var_744[param1] -= param2;
            this._manuallyLeftCut[param1] = true;
         }
      }
      
      private function calculateWallEndPoints() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(this.var_1394.length != this.count)
         {
            this.var_1394 = [];
            _loc1_ = 0;
            while(_loc1_ < this.count)
            {
               _loc2_ = this.getCorner(_loc1_);
               _loc3_ = new Point(_loc2_.x,_loc2_.y);
               _loc4_ = RoomWallData.var_431[this.getDirection(_loc1_)];
               _loc5_ = this.getLength(_loc1_);
               _loc3_.x += _loc4_.x * _loc5_;
               _loc3_.y += _loc4_.y * _loc5_;
               this.var_1394.push(_loc3_);
               _loc1_++;
            }
         }
      }
   }
}
