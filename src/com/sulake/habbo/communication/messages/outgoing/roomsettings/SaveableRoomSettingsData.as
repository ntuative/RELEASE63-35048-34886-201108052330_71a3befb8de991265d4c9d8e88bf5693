package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_2063:String;
      
      private var var_2812:int;
      
      private var _password:String;
      
      private var var_1508:int;
      
      private var var_2815:int;
      
      private var var_956:Array;
      
      private var var_2819:Array;
      
      private var var_2818:Boolean;
      
      private var var_2813:Boolean;
      
      private var var_2814:Boolean;
      
      private var _hideWalls:Boolean;
      
      private var var_2817:int;
      
      private var var_2816:int;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2818;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2818 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2813;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2813 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2814;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2814 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this._hideWalls;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this._hideWalls = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2817;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2817 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2816;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2816 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_2063;
      }
      
      public function set description(param1:String) : void
      {
         this.var_2063 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2812;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2812 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1508;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1508 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2815;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2815 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_956;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_956 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2819;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2819 = param1;
      }
   }
}
