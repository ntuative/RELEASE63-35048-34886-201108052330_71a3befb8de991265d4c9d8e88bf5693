package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_766:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1361:String = "RWOCM_CLUB_MAIN";
      
      public static const const_2236:String = "RWOCM_PIXELS";
      
      public static const const_2162:String = "RWOCM_CREDITS";
      
      public static const const_2353:String = "RWOCM_SHELLS";
       
      
      private var var_2644:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_766);
         this.var_2644 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2644;
      }
   }
}
