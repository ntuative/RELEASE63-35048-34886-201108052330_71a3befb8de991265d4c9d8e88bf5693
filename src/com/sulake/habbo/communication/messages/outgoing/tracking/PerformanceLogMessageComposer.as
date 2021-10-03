package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2857:int = 0;
      
      private var var_1648:String = "";
      
      private var var_2097:String = "";
      
      private var var_2872:String = "";
      
      private var var_2962:String = "";
      
      private var var_2147:int = 0;
      
      private var var_2961:int = 0;
      
      private var var_2960:int = 0;
      
      private var var_1649:int = 0;
      
      private var var_2959:int = 0;
      
      private var var_1647:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2857 = param1;
         this.var_1648 = param2;
         this.var_2097 = param3;
         this.var_2872 = param4;
         this.var_2962 = param5;
         if(param6)
         {
            this.var_2147 = 1;
         }
         else
         {
            this.var_2147 = 0;
         }
         this.var_2961 = param7;
         this.var_2960 = param8;
         this.var_1649 = param9;
         this.var_2959 = param10;
         this.var_1647 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2857,this.var_1648,this.var_2097,this.var_2872,this.var_2962,this.var_2147,this.var_2961,this.var_2960,this.var_1649,this.var_2959,this.var_1647];
      }
   }
}
