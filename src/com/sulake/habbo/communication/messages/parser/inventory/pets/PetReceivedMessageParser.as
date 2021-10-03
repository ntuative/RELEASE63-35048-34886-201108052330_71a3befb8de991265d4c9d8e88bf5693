package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_2075:Boolean;
      
      private var var_1092:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2075 = param1.readBoolean();
         this.var_1092 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_2075 + ", " + this.var_1092.id + ", " + this.var_1092.name + ", " + this.var_1092.type + ", " + this.var_1092.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_2075;
      }
      
      public function get pet() : PetData
      {
         return this.var_1092;
      }
   }
}
