package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomEntryData;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2094:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_215:MsgWithRequestId;
      
      private var var_630:RoomEventData;
      
      private var var_2333:Boolean;
      
      private var var_2327:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2332:int;
      
      private var var_274:GuestRoomData;
      
      private var var_965:PublicRoomShortData;
      
      private var var_2334:int;
      
      private var var_2330:Boolean;
      
      private var var_2331:int;
      
      private var var_2329:Boolean;
      
      private var var_1748:int;
      
      private var var_2328:Boolean;
      
      private var var_1462:Array;
      
      private var var_1463:Array;
      
      private var var_2326:int;
      
      private var var_1464:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1180:Boolean;
      
      private var var_2325:int;
      
      private var var_2335:Boolean;
      
      private var var_2336:int = 0;
      
      private var var_1749:OfficialRoomEntryData;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1462 = new Array();
         this.var_1463 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_274 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_274 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_965 = null;
         this.var_274 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_965 = param1.publicSpace;
            this.var_630 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_630 != null)
         {
            this.var_630.dispose();
            this.var_630 = null;
         }
         if(this.var_965 != null)
         {
            this.var_965.dispose();
            this.var_965 = null;
         }
         if(this.var_274 != null)
         {
            this.var_274.dispose();
            this.var_274 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_274 != null)
         {
            this.var_274.dispose();
         }
         this.var_274 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_630 != null)
         {
            this.var_630.dispose();
         }
         this.var_630 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_215 != null && this.var_215 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_215 != null && this.var_215 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_215 != null && this.var_215 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_215 = param1;
         this.var_1749 = param1.ad;
         this.var_1180 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_215 = param1;
         this.var_1180 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_215 = param1;
         this.var_1180 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_215 == null)
         {
            return;
         }
         this.var_215.dispose();
         this.var_215 = null;
      }
      
      public function set adRoom(param1:OfficialRoomEntryData) : void
      {
         this.var_1749 = param1;
      }
      
      public function get adRoom() : OfficialRoomEntryData
      {
         return this.var_1749;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_215 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_215 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_215 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_630;
      }
      
      public function get avatarId() : int
      {
         return this.var_2332;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2333;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2327;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_274;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_965;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2330;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2331;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1748;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2329;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2325;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2334;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2328;
      }
      
      public function get adIndex() : int
      {
         return this.var_2336;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2335;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2332 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2331 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2330 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2333 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2327 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2329 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1748 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2325 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2334 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2328 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2336 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2335 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1462 = param1;
         this.var_1463 = new Array();
         for each(_loc2_ in this.var_1462)
         {
            if(_loc2_.visible)
            {
               this.var_1463.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1462;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1463;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2326 = param1.limit;
         this.var_1464 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1464 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_274.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_274 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_274.flatId;
         return this.var_1748 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1464 >= this.var_2326;
      }
      
      public function startLoading() : void
      {
         this.var_1180 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1180;
      }
   }
}
