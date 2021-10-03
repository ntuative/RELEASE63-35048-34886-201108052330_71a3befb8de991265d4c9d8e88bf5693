package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_141:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1796:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_141);
         this.var_1796 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1796;
      }
   }
}
