package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_765:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1995:String = "inventory_effects";
      
      public static const const_1349:String = "inventory_badges";
      
      public static const const_2018:String = "inventory_clothes";
      
      public static const const_2007:String = "inventory_furniture";
       
      
      private var var_2860:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_765);
         this.var_2860 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2860;
      }
   }
}
