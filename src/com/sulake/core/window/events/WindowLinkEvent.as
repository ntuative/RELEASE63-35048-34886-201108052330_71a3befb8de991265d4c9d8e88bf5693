package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowLinkEvent extends WindowEvent
   {
      
      public static const const_1769:String = "WE_LINK";
      
      private static const POOL:Array = [];
       
      
      private var var_1849:String;
      
      public function WindowLinkEvent()
      {
         super();
         _type = const_1769;
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow) : WindowEvent
      {
         var _loc4_:WindowLinkEvent = POOL.length > 0 ? POOL.pop() : new WindowLinkEvent();
         _loc4_.var_1849 = param1;
         _loc4_._window = param2;
         _loc4_.var_760 = param3;
         _loc4_.var_167 = false;
         _loc4_.var_759 = POOL;
         return _loc4_;
      }
      
      public function get link() : String
      {
         return this.var_1849;
      }
      
      override public function clone() : WindowEvent
      {
         return allocate(this.var_1849,window,related);
      }
      
      override public function toString() : String
      {
         return "WindowLinkEvent { type: " + _type + " link: " + this.link + " cancelable: " + var_517 + " window: " + _window + " }";
      }
   }
}
