package com.sulake.habbo.communication.messages.outgoing.catalog
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SelectClubGiftComposer implements IMessageComposer
   {
       
      
      private var var_1858:String;
      
      public function SelectClubGiftComposer(param1:String)
      {
         super();
         this.var_1858 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1858];
      }
      
      public function dispose() : void
      {
         this.var_1858 = null;
      }
   }
}
