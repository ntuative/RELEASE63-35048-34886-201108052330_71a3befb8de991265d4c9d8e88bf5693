package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.utils.IIterable;
   import com.sulake.core.window.utils.IIterator;
   import flash.geom.Rectangle;
   
   public class TabContextController extends WindowController implements ITabContextWindow, IIterable
   {
      
      private static const const_1552:String = "_SELECTOR";
      
      private static const const_1551:String = "_CONTENT";
       
      
      protected var var_1164:ITabSelectorWindow;
      
      protected var var_2279:IWindowContainer;
      
      private var var_1974:Boolean = false;
      
      private var var_886:Boolean = false;
      
      public function TabContextController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var _loc13_:* = null;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var _loc12_:Array = new Array();
         groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc12_,true);
         for each(_loc13_ in _loc12_)
         {
            _loc13_.style = var_91;
            _loc13_.procedure = this.selectorEventProc;
         }
         this.var_886 = true;
      }
      
      public function get selector() : ITabSelectorWindow
      {
         if(this.var_1164 == null)
         {
            this.var_1164 = findChildByTag(const_1552) as ITabSelectorWindow;
            if(this.var_1164 != null)
            {
               this.var_1164.procedure = this.selectorEventProc;
            }
         }
         return this.var_1164;
      }
      
      public function get container() : IWindowContainer
      {
         if(this.var_2279 == null)
         {
            this.var_2279 = findChildByTag(const_1551) as IWindowContainer;
         }
         return this.var_2279;
      }
      
      public function get iterator() : IIterator
      {
         return !!this.var_886 ? this.selector.iterator : null;
      }
      
      public function get numTabItems() : uint
      {
         return this.var_1164.numSelectables;
      }
      
      public function addTabItem(param1:ITabButtonWindow) : ITabButtonWindow
      {
         return this.selector.addSelectable(param1) as ITabButtonWindow;
      }
      
      public function addTabItemAt(param1:ITabButtonWindow, param2:uint) : ITabButtonWindow
      {
         return this.selector.addSelectableAt(param1,param2) as ITabButtonWindow;
      }
      
      public function removeTabItem(param1:ITabButtonWindow) : void
      {
         this.selector.removeSelectable(param1);
      }
      
      public function getTabItemAt(param1:uint) : ITabButtonWindow
      {
         return this.selector.getSelectableAt(param1) as ITabButtonWindow;
      }
      
      public function getTabItemByName(param1:String) : ITabButtonWindow
      {
         return this.selector.getSelectableByName(param1) as ITabButtonWindow;
      }
      
      public function getTabItemByID(param1:uint) : ITabButtonWindow
      {
         return this.selector.getSelectableByID(param1) as ITabButtonWindow;
      }
      
      public function getTabItemIndex(param1:ITabButtonWindow) : uint
      {
         return this.selector.getSelectableIndex(param1);
      }
      
      private function selectorEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowEvent.const_47)
         {
            notifyEventListeners(param1);
         }
      }
   }
}
