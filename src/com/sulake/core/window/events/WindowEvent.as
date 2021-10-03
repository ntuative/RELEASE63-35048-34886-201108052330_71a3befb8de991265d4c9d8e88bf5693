package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1804:String = "WE_DESTROY";
      
      public static const const_341:String = "WE_DESTROYED";
      
      public static const const_1980:String = "WE_OPEN";
      
      public static const const_1984:String = "WE_OPENED";
      
      public static const const_1846:String = "WE_CLOSE";
      
      public static const const_1803:String = "WE_CLOSED";
      
      public static const const_1992:String = "WE_FOCUS";
      
      public static const const_330:String = "WE_FOCUSED";
      
      public static const const_1930:String = "WE_UNFOCUS";
      
      public static const const_1853:String = "WE_UNFOCUSED";
      
      public static const const_1993:String = "WE_ACTIVATE";
      
      public static const const_675:String = "WE_ACTIVATED";
      
      public static const const_2050:String = "WE_DEACTIVATE";
      
      public static const const_585:String = "WE_DEACTIVATED";
      
      public static const const_335:String = "WE_SELECT";
      
      public static const const_47:String = "WE_SELECTED";
      
      public static const const_516:String = "WE_UNSELECT";
      
      public static const const_653:String = "WE_UNSELECTED";
      
      public static const const_1877:String = "WE_LOCK";
      
      public static const const_1894:String = "WE_LOCKED";
      
      public static const const_1825:String = "WE_UNLOCK";
      
      public static const const_1885:String = "WE_UNLOCKED";
      
      public static const const_1003:String = "WE_ENABLE";
      
      public static const const_209:String = "WE_ENABLED";
      
      public static const const_807:String = "WE_DISABLE";
      
      public static const const_237:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_415:String = "WE_RELOCATED";
      
      public static const const_1367:String = "WE_RESIZE";
      
      public static const const_41:String = "WE_RESIZED";
      
      public static const const_2025:String = "WE_MINIMIZE";
      
      public static const const_2043:String = "WE_MINIMIZED";
      
      public static const const_1847:String = "WE_MAXIMIZE";
      
      public static const const_1826:String = "WE_MAXIMIZED";
      
      public static const const_1997:String = "WE_RESTORE";
      
      public static const const_1768:String = "WE_RESTORED";
      
      public static const const_533:String = "WE_CHILD_ADDED";
      
      public static const const_413:String = "WE_CHILD_REMOVED";
      
      public static const const_219:String = "WE_CHILD_RELOCATED";
      
      public static const const_181:String = "WE_CHILD_RESIZED";
      
      public static const const_346:String = "WE_CHILD_ACTIVATED";
      
      public static const const_529:String = "WE_PARENT_ADDED";
      
      public static const const_1968:String = "WE_PARENT_REMOVED";
      
      public static const const_1823:String = "WE_PARENT_RELOCATED";
      
      public static const const_671:String = "WE_PARENT_RESIZED";
      
      public static const const_1391:String = "WE_PARENT_ACTIVATED";
      
      public static const const_170:String = "WE_OK";
      
      public static const const_532:String = "WE_CANCEL";
      
      public static const const_119:String = "WE_CHANGE";
      
      public static const const_577:String = "WE_SCROLL";
      
      public static const const_113:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_760:IWindow;
      
      protected var var_1163:Boolean;
      
      protected var var_517:Boolean;
      
      protected var var_167:Boolean;
      
      protected var var_759:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_760 = param3;
         _loc5_.var_517 = param4;
         _loc5_.var_167 = false;
         _loc5_.var_759 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_760;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_517;
      }
      
      public function recycle() : void
      {
         if(this.var_167)
         {
            throw new Error("Event already recycled!");
         }
         this.var_760 = null;
         this._window = null;
         this.var_167 = true;
         this.var_1163 = false;
         this.var_759.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1163;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1163 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1163;
      }
      
      public function stopPropagation() : void
      {
         this.var_1163 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1163 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_517 + " window: " + this._window + " }";
      }
   }
}
