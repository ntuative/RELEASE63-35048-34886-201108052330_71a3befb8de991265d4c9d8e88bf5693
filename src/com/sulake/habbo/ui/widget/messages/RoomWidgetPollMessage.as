package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPollMessage extends RoomWidgetMessage
   {
      
      public static const const_908:String = "RWPM_START";
      
      public static const const_536:String = "RWPM_REJECT";
      
      public static const ANSWER:String = "RWPM_ANSWER";
       
      
      private var _id:int = -1;
      
      private var var_1843:int = 0;
      
      private var var_2524:Array = null;
      
      public function RoomWidgetPollMessage(param1:String, param2:int)
      {
         this._id = param2;
         super(param1);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get questionId() : int
      {
         return this.var_1843;
      }
      
      public function set questionId(param1:int) : void
      {
         this.var_1843 = param1;
      }
      
      public function get answers() : Array
      {
         return this.var_2524;
      }
      
      public function set answers(param1:Array) : void
      {
         this.var_2524 = param1;
      }
   }
}
