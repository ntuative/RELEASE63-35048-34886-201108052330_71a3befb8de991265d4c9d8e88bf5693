package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_782:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2748:int;
      
      private var var_2749:int;
      
      private var _color:uint;
      
      private var var_1288:int;
      
      private var var_2803:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_782);
         this.var_2748 = param1;
         this.var_2749 = param2;
         this._color = param3;
         this.var_1288 = param4;
         this.var_2803 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2748;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2749;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1288;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2803;
      }
   }
}
