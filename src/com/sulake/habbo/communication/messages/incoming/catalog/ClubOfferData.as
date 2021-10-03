package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1242:int;
      
      private var var_1858:String;
      
      private var var_1864:int;
      
      private var _upgrade:Boolean;
      
      private var var_2722:Boolean;
      
      private var var_2720:int;
      
      private var var_2723:int;
      
      private var var_2719:int;
      
      private var var_2724:int;
      
      private var var_2721:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1242 = param1.readInteger();
         this.var_1858 = param1.readString();
         this.var_1864 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2722 = param1.readBoolean();
         this.var_2720 = param1.readInteger();
         this.var_2723 = param1.readInteger();
         this.var_2719 = param1.readInteger();
         this.var_2724 = param1.readInteger();
         this.var_2721 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1242;
      }
      
      public function get productCode() : String
      {
         return this.var_1858;
      }
      
      public function get price() : int
      {
         return this.var_1864;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2722;
      }
      
      public function get periods() : int
      {
         return this.var_2720;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2723;
      }
      
      public function get year() : int
      {
         return this.var_2719;
      }
      
      public function get month() : int
      {
         return this.var_2724;
      }
      
      public function get day() : int
      {
         return this.var_2721;
      }
   }
}
