package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2801:int;
      
      private var var_2800:int;
      
      private var var_2802:int;
      
      private var var_2799:String;
      
      private var var_1850:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2801 = param1.readInteger();
         this.var_2800 = param1.readInteger();
         this.var_2802 = param1.readInteger();
         this.var_2799 = param1.readString();
         this.var_1850 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2801;
      }
      
      public function get minute() : int
      {
         return this.var_2800;
      }
      
      public function get chatterId() : int
      {
         return this.var_2802;
      }
      
      public function get chatterName() : String
      {
         return this.var_2799;
      }
      
      public function get msg() : String
      {
         return this.var_1850;
      }
   }
}
