package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FavouriteMembershipUpdateMessageParser implements IMessageParser
   {
       
      
      private var var_2438:int;
      
      private var var_2713:int;
      
      private var var_434:int;
      
      public function FavouriteMembershipUpdateMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2438 = param1.readInteger();
         this.var_2713 = param1.readInteger();
         this.var_434 = param1.readInteger();
         return true;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2438;
      }
      
      public function get habboGroupId() : int
      {
         return this.var_2713;
      }
      
      public function get status() : int
      {
         return this.var_434;
      }
   }
}
