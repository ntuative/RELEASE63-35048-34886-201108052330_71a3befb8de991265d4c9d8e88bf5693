package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1418:int;
      
      private var var_2403:String;
      
      private var var_2402:int;
      
      private var var_2744:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1418 = param1.readInteger();
         this.var_2403 = param1.readString();
         this.var_2744 = param1.readString();
         this.var_2402 = this.var_1418;
      }
      
      public function get requestId() : int
      {
         return this.var_1418;
      }
      
      public function get requesterName() : String
      {
         return this.var_2403;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2402;
      }
      
      public function get figureString() : String
      {
         return this.var_2744;
      }
   }
}
