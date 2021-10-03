package com.sulake.habbo.toolbar
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.habbo.toolbar.events.ExtensionViewEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ExtensionView implements IExtensionView
   {
      
      private static const const_1080:int = 3;
       
      
      private var _toolbar:HabboToolbar;
      
      private var var_130:IItemListWindow;
      
      private var _items:Map;
      
      private var _disposed:Boolean = false;
      
      public function ExtensionView(param1:IHabboWindowManager, param2:IAssetLibrary, param3:HabboToolbar)
      {
         super();
         this._toolbar = param3;
         var _loc4_:XmlAsset = param2.getAssetByName("extension_grid_xml") as XmlAsset;
         if(_loc4_)
         {
            this.var_130 = param1.buildFromXML(_loc4_.content as XML,1) as IItemListWindow;
         }
         var _loc5_:IWindowContainer = this.var_130.desktop;
         if(this.var_130)
         {
            this.var_130.x = _loc5_.width - this.var_130.width - const_1080;
            this.var_130.y = const_1080;
            this.var_130.visible = true;
         }
         else
         {
            Core.error("Unable to initialize Toolbar Extension view window from xml asset",false,Core.const_1309);
         }
         this._items = new Map();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!this._disposed)
         {
            _loc1_ = this._items.getKeys();
            for each(_loc2_ in _loc1_)
            {
               this.detachExtension(_loc2_);
            }
            if(this.var_130)
            {
               this.var_130.dispose();
               this.var_130 = null;
            }
            this._toolbar = null;
            this._items = null;
            this._disposed = true;
         }
      }
      
      public function get screenHeight() : uint
      {
         if(!this.var_130)
         {
            return 0;
         }
         return this.var_130.height + this.var_130.y;
      }
      
      public function attachExtension(param1:String, param2:IWindow, param3:int = -1) : void
      {
         if(this._items.getValue(param1))
         {
            return;
         }
         this._items.add(param1,param2);
         if(this.var_130)
         {
            if(param3 == -1)
            {
               this.var_130.addListItem(param2);
            }
            else
            {
               this.var_130.addListItemAt(param2,param3);
            }
            this.var_130.invalidate();
         }
         this.queueResizeEvent();
      }
      
      public function detachExtension(param1:String) : void
      {
         var _loc2_:IWindow = this._items[param1];
         if(this.var_130)
         {
            this.var_130.removeListItem(_loc2_);
         }
         this._items.remove(param1);
         this.queueResizeEvent();
      }
      
      private function queueResizeEvent() : void
      {
         var _loc1_:Timer = new Timer(25,1);
         _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onResizeTimer);
         _loc1_.start();
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         if(this._toolbar)
         {
            this._toolbar.events.dispatchEvent(new ExtensionViewEvent(ExtensionViewEvent.const_1425));
         }
      }
   }
}
