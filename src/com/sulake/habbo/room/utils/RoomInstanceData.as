package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_800:TileHeightMap = null;
      
      private var var_1216:LegacyWallGeometry = null;
      
      private var var_1215:RoomCamera = null;
      
      private var var_801:SelectedRoomObjectData = null;
      
      private var var_799:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_538:Map;
      
      private var var_539:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_538 = new Map();
         this.var_539 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1216 = new LegacyWallGeometry();
         this.var_1215 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_800;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_800 != null)
         {
            this.var_800.dispose();
         }
         this.var_800 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1216;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1215;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_801;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_801 != null)
         {
            this.var_801.dispose();
         }
         this.var_801 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_799;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_799 != null)
         {
            this.var_799.dispose();
         }
         this.var_799 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_800 != null)
         {
            this.var_800.dispose();
            this.var_800 = null;
         }
         if(this.var_1216 != null)
         {
            this.var_1216.dispose();
            this.var_1216 = null;
         }
         if(this.var_1215 != null)
         {
            this.var_1215.dispose();
            this.var_1215 = null;
         }
         if(this.var_801 != null)
         {
            this.var_801.dispose();
            this.var_801 = null;
         }
         if(this.var_799 != null)
         {
            this.var_799.dispose();
            this.var_799 = null;
         }
         if(this.var_538 != null)
         {
            this.var_538.dispose();
            this.var_538 = null;
         }
         if(this.var_539 != null)
         {
            this.var_539.dispose();
            this.var_539 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_538.remove(param1.id);
            this.var_538.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_538.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_538.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_538.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_539.remove(param1.id);
            this.var_539.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_539.length > 0)
         {
            return this.getWallItemDataWithId(this.var_539.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_539.remove(param1);
      }
   }
}
