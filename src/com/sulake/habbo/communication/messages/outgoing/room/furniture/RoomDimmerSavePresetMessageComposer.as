package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2748:int;
      
      private var var_2749:int;
      
      private var var_2746:String;
      
      private var var_2750:int;
      
      private var var_2747:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2748 = param1;
         this.var_2749 = param2;
         this.var_2746 = param3;
         this.var_2750 = param4;
         this.var_2747 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2748,this.var_2749,this.var_2746,this.var_2750,int(this.var_2747)];
      }
      
      public function dispose() : void
      {
      }
   }
}
