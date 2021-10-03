package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_190:String = "RSUBE_FIGURE";
       
      
      private var _userId:int = 0;
      
      private var _figure:String = "";
      
      private var var_1006:String = "";
      
      private var var_2113:String = "";
      
      private var var_2452:int;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(const_190,param1,param7,param8);
         this._userId = param2;
         this._figure = param3;
         this.var_1006 = param4;
         this.var_2113 = param5;
         this.var_2452 = param6;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get gender() : String
      {
         return this.var_1006;
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
