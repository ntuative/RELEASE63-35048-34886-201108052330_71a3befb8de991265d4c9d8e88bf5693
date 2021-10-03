package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2127:int;
      
      private var var_2921:int;
      
      private var var_1676:int;
      
      private var var_2922:int;
      
      private var var_135:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2127 = param1.readInteger();
         this.var_2921 = param1.readInteger();
         this.var_1676 = param1.readInteger();
         this.var_2922 = param1.readInteger();
         this.var_135 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2127);
      }
      
      public function get callId() : int
      {
         return this.var_2127;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2921;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1676;
      }
      
      public function get method_5() : int
      {
         return this.var_2922;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_135;
      }
   }
}
