package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_173:String = "ROE_MOUSE_CLICK";
      
      public static const const_193:String = "ROE_MOUSE_ENTER";
      
      public static const const_618:String = "ROE_MOUSE_MOVE";
      
      public static const const_201:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2151:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_620:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2093:String = "";
      
      private var var_2844:Boolean;
      
      private var var_2843:Boolean;
      
      private var var_2845:Boolean;
      
      private var var_2842:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_2093 = param2;
         this.var_2844 = param5;
         this.var_2843 = param6;
         this.var_2845 = param7;
         this.var_2842 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_2093;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2844;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2843;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2845;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2842;
      }
   }
}
