package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_263:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2323:int = 0;
      
      private var var_2321:int = 0;
      
      private var var_2324:int = 0;
      
      private var var_2322:Boolean = false;
      
      private var _clubLevel:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_263,param6,param7);
         this.var_2323 = param1;
         this.var_2321 = param2;
         this.var_2324 = param3;
         this.var_2322 = param4;
         this._clubLevel = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2323;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2321;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2324;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2322;
      }
      
      public function get clubLevel() : int
      {
         return this._clubLevel;
      }
   }
}
