package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_396:int;
      
      private var var_852:Boolean;
      
      private var var_1067:String;
      
      private var _ownerName:String;
      
      private var var_2812:int;
      
      private var var_2835:int;
      
      private var var_2850:int;
      
      private var var_2063:String;
      
      private var var_2853:int;
      
      private var var_2851:Boolean;
      
      private var var_847:int;
      
      private var var_1508:int;
      
      private var var_2848:String;
      
      private var var_956:Array;
      
      private var var_2849:RoomThumbnailData;
      
      private var var_2818:Boolean;
      
      private var var_2852:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_956 = new Array();
         super();
         this.var_396 = param1.readInteger();
         this.var_852 = param1.readBoolean();
         this.var_1067 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2812 = param1.readInteger();
         this.var_2835 = param1.readInteger();
         this.var_2850 = param1.readInteger();
         this.var_2063 = param1.readString();
         this.var_2853 = param1.readInteger();
         this.var_2851 = param1.readBoolean();
         this.var_847 = param1.readInteger();
         this.var_1508 = param1.readInteger();
         this.var_2848 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_956.push(_loc4_);
            _loc3_++;
         }
         this.var_2849 = new RoomThumbnailData(param1);
         this.var_2818 = param1.readBoolean();
         this.var_2852 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_956 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_396;
      }
      
      public function get event() : Boolean
      {
         return this.var_852;
      }
      
      public function get roomName() : String
      {
         return this.var_1067;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2812;
      }
      
      public function get userCount() : int
      {
         return this.var_2835;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2850;
      }
      
      public function get description() : String
      {
         return this.var_2063;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2853;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2851;
      }
      
      public function get score() : int
      {
         return this.var_847;
      }
      
      public function get categoryId() : int
      {
         return this.var_1508;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2848;
      }
      
      public function get tags() : Array
      {
         return this.var_956;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2849;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2818;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2852;
      }
   }
}
