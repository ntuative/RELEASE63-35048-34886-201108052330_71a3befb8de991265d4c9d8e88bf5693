package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetFriendRequestMessage extends RoomWidgetMessage
   {
      
      public static const const_796:String = "RWFRM_ACCEPT";
      
      public static const const_963:String = "RWFRM_DECLINE";
       
      
      private var var_1418:int = 0;
      
      public function RoomWidgetFriendRequestMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this.var_1418 = param2;
      }
      
      public function get requestId() : int
      {
         return this.var_1418;
      }
   }
}
