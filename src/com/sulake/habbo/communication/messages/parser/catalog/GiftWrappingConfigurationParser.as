package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2781:Boolean;
      
      private var var_2782:int;
      
      private var var_1846:Array;
      
      private var var_820:Array;
      
      private var var_822:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2781;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2782;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1846;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_820;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_822;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1846 = [];
         this.var_820 = [];
         this.var_822 = [];
         this.var_2781 = param1.readBoolean();
         this.var_2782 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1846.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_820.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_822.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
