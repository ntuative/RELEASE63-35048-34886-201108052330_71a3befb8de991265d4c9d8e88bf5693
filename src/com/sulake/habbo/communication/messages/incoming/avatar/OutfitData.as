package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1836:int;
      
      private var var_2744:String;
      
      private var var_1006:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1836 = param1.readInteger();
         this.var_2744 = param1.readString();
         this.var_1006 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1836;
      }
      
      public function get figureString() : String
      {
         return this.var_2744;
      }
      
      public function get gender() : String
      {
         return this.var_1006;
      }
   }
}
