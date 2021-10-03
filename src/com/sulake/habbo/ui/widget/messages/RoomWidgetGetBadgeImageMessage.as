package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_1012:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_2487:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_1012);
         this.var_2487 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_2487;
      }
   }
}
