package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_747:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_238:int = -1;
      
      private var var_1429:String;
      
      private var _text:String;
      
      private var var_363:String;
      
      private var var_26:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         this.var_238 = param2;
         this.var_1429 = param3;
         this._text = param4;
         this.var_363 = param5;
         this.var_26 = param6;
      }
      
      public function get objectId() : int
      {
         return this.var_238;
      }
      
      public function get objectType() : String
      {
         return this.var_1429;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get colorHex() : String
      {
         return this.var_363;
      }
      
      public function get controller() : Boolean
      {
         return this.var_26;
      }
   }
}
