package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_487:RoomObjectLocationCacheItem = null;
      
      private var var_217:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_487 = new RoomObjectLocationCacheItem(param1);
         this.var_217 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_487;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_217;
      }
      
      public function dispose() : void
      {
         if(this.var_487 != null)
         {
            this.var_487.dispose();
            this.var_487 = null;
         }
         if(this.var_217 != null)
         {
            this.var_217.dispose();
            this.var_217 = null;
         }
      }
   }
}
