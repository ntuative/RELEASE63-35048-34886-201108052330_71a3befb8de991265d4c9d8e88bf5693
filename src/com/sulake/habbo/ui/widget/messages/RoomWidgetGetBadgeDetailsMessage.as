package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_814:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_2428:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_814);
         this.var_2428 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_2428;
      }
   }
}
