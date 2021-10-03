package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1452:IHabboTracking;
      
      private var var_2124:Boolean = false;
      
      private var var_2601:int = 0;
      
      private var var_1879:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1452 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1452 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2124 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2601 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2124)
         {
            return;
         }
         ++this.var_1879;
         if(this.var_1879 <= this.var_2601)
         {
            this.var_1452.trackGoogle("toolbar",param1);
         }
      }
   }
}
