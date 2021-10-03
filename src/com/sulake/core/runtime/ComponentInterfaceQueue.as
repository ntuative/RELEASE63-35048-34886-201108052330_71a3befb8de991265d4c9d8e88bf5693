package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2112:IID;
      
      private var var_1172:Boolean;
      
      private var var_1365:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2112 = param1;
         this.var_1365 = new Array();
         this.var_1172 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2112;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1172;
      }
      
      public function get receivers() : Array
      {
         return this.var_1365;
      }
      
      public function dispose() : void
      {
         if(!this.var_1172)
         {
            this.var_1172 = true;
            this.var_2112 = null;
            while(this.var_1365.length > 0)
            {
               this.var_1365.pop();
            }
            this.var_1365 = null;
         }
      }
   }
}
