package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1781:int;
      
      private var var_2390:int;
      
      private var var_898:int;
      
      private var var_587:Number;
      
      private var var_2388:Boolean;
      
      private var var_2389:int;
      
      private var var_1782:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_587);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2390 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2389 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2388 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_898;
         if(this.var_898 == 1)
         {
            this.var_587 = param1;
            this.var_1781 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_898);
            this.var_587 = this.var_587 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2388 && param3 - this.var_1781 >= this.var_2390)
         {
            this.var_898 = 0;
            if(this.var_1782 < this.var_2389)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_1782;
               this.var_1781 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
