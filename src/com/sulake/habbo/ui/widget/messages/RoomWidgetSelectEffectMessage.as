package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_1297:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_1381:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_1300:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_931:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_931 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_931;
      }
   }
}
