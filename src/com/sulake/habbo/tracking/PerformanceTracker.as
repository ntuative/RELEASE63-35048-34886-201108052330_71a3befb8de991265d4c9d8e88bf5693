package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var _configuration:IHabboConfigurationManager = null;
      
      private var var_624:int = 0;
      
      private var var_587:Number = 0;
      
      private var var_3123:Array;
      
      private var var_1648:String = "";
      
      private var var_2097:String = "";
      
      private var var_2872:String = "";
      
      private var var_2962:String = "";
      
      private var var_2147:Boolean = false;
      
      private var var_2095:GarbageMonitor = null;
      
      private var var_1649:int = 0;
      
      private var var_2871:Boolean;
      
      private var var_2098:int = 1000;
      
      private var var_1647:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1781:int = 0;
      
      private var var_2096:int = 10;
      
      private var var_1646:int = 0;
      
      private var var_2868:Number = 0.15;
      
      private var var_2870:Boolean = true;
      
      private var var_2869:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_3123 = [];
         super();
         this.var_2097 = Capabilities.version;
         this.var_2872 = Capabilities.os;
         this.var_2147 = Capabilities.isDebugger;
         this.var_1648 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1648 == null)
         {
            this.var_1648 = "unknown";
         }
         this.var_2095 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1781 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_2097;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_587;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_2098 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_2096 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this._configuration = param1;
         this._reportInterval = int(this._configuration.getKey("performancetest.interval","60"));
         this.var_2098 = int(this._configuration.getKey("performancetest.slowupdatelimit","1000"));
         this.var_2096 = int(this._configuration.getKey("performancetest.reportlimit","10"));
         this.var_2868 = Number(this._configuration.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2870 = Boolean(int(this._configuration.getKey("performancetest.distribution.enabled","1")));
         this.var_2871 = Boolean(this._configuration.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_2095.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_2095.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         if(this.var_2871)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1649;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_2098)
         {
            ++this.var_1647;
            _loc3_ = true;
         }
         else
         {
            ++this.var_624;
            if(this.var_624 <= 1)
            {
               this.var_587 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_624);
               this.var_587 = this.var_587 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1781 > this._reportInterval * 1000 && this.var_1646 < this.var_2096)
         {
            _loc6_ = 0;
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_587 + "/s, system memory usage : " + _loc6_ + " bytes");
            _loc7_ = true;
            if(this.var_2870 && this.var_1646 > 0)
            {
               _loc8_ = this.differenceInPercents(this.var_2869,this.var_587);
               if(_loc8_ < this.var_2868)
               {
                  _loc7_ = false;
               }
            }
            this.var_1781 = param2;
            if(_loc7_ || _loc3_)
            {
               this.var_2869 = this.var_587;
               if(this.sendReport(param2))
               {
                  ++this.var_1646;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1648,this.var_2097,this.var_2872,this.var_2962,this.var_2147,_loc5_,_loc4_,this.var_1649,this.var_587,this.var_1647);
            this._connection.send(_loc2_);
            this.var_1649 = 0;
            this.var_587 = 0;
            this.var_624 = 0;
            this.var_1647 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
