package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_110:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_176:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_856:int = 2;
      
      public static const const_1021:int = 3;
      
      public static const const_1831:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_2068:String = "";
      
      private var var_2452:int;
      
      private var var_2454:int = 0;
      
      private var var_2455:int = 0;
      
      private var _figure:String = "";
      
      private var var_49:BitmapData = null;
      
      private var var_262:Array;
      
      private var var_2428:int = 0;
      
      private var var_2444:String = "";
      
      private var var_2456:int = 0;
      
      private var var_2446:int = 0;
      
      private var var_1933:Boolean = false;
      
      private var var_1969:String = "";
      
      private var var_2287:Boolean = false;
      
      private var var_2450:Boolean = false;
      
      private var var_2457:Boolean = true;
      
      private var var_1379:int = 0;
      
      private var var_2458:Boolean = false;
      
      private var var_2449:Boolean = false;
      
      private var var_2445:Boolean = false;
      
      private var var_2451:Boolean = false;
      
      private var var_2448:Boolean = false;
      
      private var var_2447:Boolean = false;
      
      private var var_2453:int = 0;
      
      private var var_1932:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_262 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_2068 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_2068;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2452 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2452;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2454 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2454;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2455 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2455;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_49 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_262 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_262;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_2428 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_2428;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2444 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2444;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2450 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2450;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1379 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1379;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2458 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2458;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2449 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2449;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2445 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2445;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2451 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2451;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2448 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2448;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2447 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2447;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2453 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2453;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2457 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2457;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1932 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1932;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2456 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2456;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2446 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2446;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1933 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1933;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1969 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1969;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2287 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2287;
      }
   }
}
