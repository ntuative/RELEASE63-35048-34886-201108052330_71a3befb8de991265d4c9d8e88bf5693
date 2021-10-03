package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_379:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_2063:String = "";
      
      private var var_49:BitmapData = null;
      
      private var var_2504:Boolean = false;
      
      private var var_2506:Boolean = false;
      
      private var var_1932:Boolean = false;
      
      private var var_1930:Boolean = false;
      
      private var var_2505:Boolean = false;
      
      private var var_2073:int = -1;
      
      private var var_2419:int = -1;
      
      private var var_1242:int = -1;
      
      private var var_1089:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_2063 = param1;
      }
      
      public function get description() : String
      {
         return this.var_2063;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_49 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2504 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2504;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2506 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2506;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1932 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1932;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1930 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1930;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2505 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2505;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_2073 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_2073;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2419 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2419;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1242 = param1;
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function set extraParam(param1:String) : void
      {
         this.var_1089 = param1;
      }
      
      public function get extraParam() : String
      {
         return this.var_1089;
      }
   }
}
