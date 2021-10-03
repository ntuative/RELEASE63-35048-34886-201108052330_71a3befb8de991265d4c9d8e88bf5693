package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserFigureUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_190:String = "RWUTUE_USER_FIGURE";
       
      
      private var _userId:int;
      
      private var var_49:BitmapData;
      
      private var var_2772:Boolean;
      
      private var var_2113:String = "";
      
      private var var_2452:int;
      
      public function RoomWidgetUserFigureUpdateEvent(param1:int, param2:BitmapData, param3:Boolean, param4:String, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_190,param6,param7);
         this._userId = param1;
         this.var_49 = param2;
         this.var_2772 = param3;
         this.var_2113 = param4;
         this.var_2452 = param5;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2772;
      }
      
      public function get customInfo() : String
      {
         return this.var_2113;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2452;
      }
   }
}
