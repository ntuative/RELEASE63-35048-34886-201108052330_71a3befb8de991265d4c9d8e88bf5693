package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2137:int;
      
      private var var_2507:String;
      
      private var var_321:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2137 = param1.readInteger();
         this.var_2507 = param1.readString();
         this.var_321 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2137;
      }
      
      public function get nodeName() : String
      {
         return this.var_2507;
      }
      
      public function get visible() : Boolean
      {
         return this.var_321;
      }
   }
}
