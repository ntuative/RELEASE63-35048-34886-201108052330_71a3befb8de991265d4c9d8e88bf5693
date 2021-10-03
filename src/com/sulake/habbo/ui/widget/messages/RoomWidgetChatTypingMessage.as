package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_917:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_745:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_917);
         this.var_745 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_745;
      }
   }
}
