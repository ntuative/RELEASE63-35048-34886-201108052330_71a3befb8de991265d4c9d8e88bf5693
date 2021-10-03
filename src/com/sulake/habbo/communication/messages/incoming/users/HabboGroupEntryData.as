package com.sulake.habbo.communication.messages.incoming.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboGroupEntryData
   {
       
      
      private var var_2428:int;
      
      private var var_2934:String;
      
      public function HabboGroupEntryData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2428 = param1.readInteger();
         this.var_2934 = param1.readString();
      }
      
      public function get groupId() : int
      {
         return this.var_2428;
      }
      
      public function get groupName() : String
      {
         return this.var_2934;
      }
   }
}
