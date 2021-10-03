package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2547:int;
      
      private var var_2549:int;
      
      private var var_2548:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2547 = param1;
         this.var_2549 = param2;
         this.var_2548 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2547,this.var_2549,this.var_2548];
      }
      
      public function dispose() : void
      {
      }
   }
}
