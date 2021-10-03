package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_111:int;
      
      private var var_2707:int;
      
      public function RoomObjectAvatarEffectUpdateMessage(param1:int = 0, param2:int = 0)
      {
         super();
         this.var_111 = param1;
         this.var_2707 = param2;
      }
      
      public function get effect() : int
      {
         return this.var_111;
      }
      
      public function get delayMilliSeconds() : int
      {
         return this.var_2707;
      }
   }
}
