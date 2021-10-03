package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_820:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_276:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_820,param2,param3);
         this.var_276 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_276;
      }
   }
}
