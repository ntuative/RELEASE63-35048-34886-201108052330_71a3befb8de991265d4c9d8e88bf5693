package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3108:uint;
      
      private var _root:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_704:IWindowContext;
      
      private var var_1237:IMouseDraggingService;
      
      private var var_1235:IMouseScalingService;
      
      private var var_1234:IMouseListenerService;
      
      private var var_1233:IFocusManagerService;
      
      private var var_1232:IToolTipAgentService;
      
      private var var_1236:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3108 = 0;
         this._root = param2;
         this.var_704 = param1;
         this.var_1237 = new WindowMouseDragger(param2);
         this.var_1235 = new WindowMouseScaler(param2);
         this.var_1234 = new WindowMouseListener(param2);
         this.var_1233 = new FocusManager(param2);
         this.var_1232 = new WindowToolTipAgent(param2);
         this.var_1236 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1237 != null)
         {
            this.var_1237.dispose();
            this.var_1237 = null;
         }
         if(this.var_1235 != null)
         {
            this.var_1235.dispose();
            this.var_1235 = null;
         }
         if(this.var_1234 != null)
         {
            this.var_1234.dispose();
            this.var_1234 = null;
         }
         if(this.var_1233 != null)
         {
            this.var_1233.dispose();
            this.var_1233 = null;
         }
         if(this.var_1232 != null)
         {
            this.var_1232.dispose();
            this.var_1232 = null;
         }
         if(this.var_1236 != null)
         {
            this.var_1236.dispose();
            this.var_1236 = null;
         }
         this._root = null;
         this.var_704 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1237;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1235;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1234;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1233;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1232;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1236;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
