package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2093:String = "";
      
      private var var_2145:String = "";
      
      private var var_2840:String = "";
      
      private var var_3065:Number = 0;
      
      private var var_3066:Number = 0;
      
      private var var_2564:Number = 0;
      
      private var var_2565:Number = 0;
      
      private var var_2843:Boolean = false;
      
      private var var_2844:Boolean = false;
      
      private var var_2845:Boolean = false;
      
      private var var_2842:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2093 = param2;
         this.var_2145 = param3;
         this.var_2840 = param4;
         this.var_3065 = param5;
         this.var_3066 = param6;
         this.var_2564 = param7;
         this.var_2565 = param8;
         this.var_2843 = param9;
         this.var_2844 = param10;
         this.var_2845 = param11;
         this.var_2842 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2093;
      }
      
      public function get canvasId() : String
      {
         return this.var_2145;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2840;
      }
      
      public function get screenX() : Number
      {
         return this.var_3065;
      }
      
      public function get screenY() : Number
      {
         return this.var_3066;
      }
      
      public function get localX() : Number
      {
         return this.var_2564;
      }
      
      public function get localY() : Number
      {
         return this.var_2565;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2843;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2844;
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
