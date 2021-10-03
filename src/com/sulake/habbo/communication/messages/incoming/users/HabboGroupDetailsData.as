package com.sulake.habbo.communication.messages.incoming.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboGroupDetailsData
   {
      
      public static const const_1793:int = 0;
      
      public static const const_1277:int = 1;
      
      public static const const_1810:int = 2;
       
      
      private var var_2428:int;
      
      private var var_2934:String;
      
      private var var_2063:String;
      
      private var var_2488:String;
      
      private var _roomId:int = -1;
      
      private var var_1067:String = "";
      
      private var var_434:int;
      
      private var var_2933:int;
      
      private var var_2932:Boolean;
      
      public function HabboGroupDetailsData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2428 = param1.readInteger();
         this.var_2934 = param1.readString();
         this.var_2063 = param1.readString();
         this.var_2488 = param1.readString();
         this._roomId = param1.readInteger();
         this.var_1067 = param1.readString();
         this.var_434 = param1.readInteger();
         this.var_2933 = param1.readInteger();
         this.var_2932 = param1.readBoolean();
      }
      
      public function get groupId() : int
      {
         return this.var_2428;
      }
      
      public function get groupName() : String
      {
         return this.var_2934;
      }
      
      public function get description() : String
      {
         return this.var_2063;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2488;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_1067;
      }
      
      public function get status() : int
      {
         return this.var_434;
      }
      
      public function get totalMembers() : int
      {
         return this.var_2933;
      }
      
      public function get favourite() : Boolean
      {
         return this.var_2932;
      }
   }
}
