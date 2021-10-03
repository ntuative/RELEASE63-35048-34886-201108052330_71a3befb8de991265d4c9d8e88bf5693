package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1242:int;
      
      private var var_2555:Boolean;
      
      private var var_2395:Boolean;
      
      private var var_2556:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1242 = param1.readInteger();
         this.var_2555 = param1.readBoolean();
         this.var_2556 = param1.readInteger();
         this.var_2395 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2555;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2395;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2556;
      }
   }
}
