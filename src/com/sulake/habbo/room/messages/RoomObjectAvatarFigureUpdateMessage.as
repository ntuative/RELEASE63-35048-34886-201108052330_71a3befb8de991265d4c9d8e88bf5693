package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var _figure:String;
      
      private var var_2846:String;
      
      private var var_1006:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this._figure = param1;
         this.var_1006 = param2;
         this.var_2846 = param3;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get race() : String
      {
         return this.var_2846;
      }
      
      public function get gender() : String
      {
         return this.var_1006;
      }
   }
}
