package com.sulake.habbo.navigator.mainview.tabpagedecorators
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.domain.Tabs;
   
   public class EventsTabPageDecorator implements ITabPageDecorator
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_162:IDropMenuWindow;
      
      public function EventsTabPageDecorator(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
      }
      
      public function refreshCustomContent(param1:IWindowContainer) : void
      {
         var _loc3_:IWindowContainer = param1.getChildByName("events_header") as IWindowContainer;
         if(this.var_162 == null)
         {
            this.var_162 = IDropMenuWindow(_loc3_.findChildByName("eventCtgFilter"));
            this.prepareEventTypes();
            this.var_162.addEventListener(WindowEvent.const_47,this.onFilterSelected);
         }
         _loc3_.visible = true;
      }
      
      public function tabSelected() : void
      {
         if(this.var_162 != null)
         {
            this.var_162.removeEventListener(WindowEvent.const_47,this.onFilterSelected);
            this.var_162.selection = 0;
            this.var_162.addEventListener(WindowEvent.const_47,this.onFilterSelected);
         }
      }
      
      public function refreshFooter(param1:IWindowContainer) : void
      {
         this._navigator.officialRoomEntryManager.refreshAdFooter(param1);
      }
      
      public function navigatorOpenedWhileInTab() : void
      {
         this.startSearch();
      }
      
      private function prepareEventTypes() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_162 == null)
         {
            return;
         }
         var _loc1_:Array = new Array();
         _loc1_.push(this._navigator.getText("navigator.navisel.alllatestevents"));
         var _loc3_:int = 1;
         while(_loc3_ < 100)
         {
            _loc4_ = "roomevent_type_" + _loc3_;
            _loc5_ = this._navigator.getText(_loc4_);
            if(_loc5_ == null || _loc5_ == _loc4_)
            {
               break;
            }
            _loc1_.push(_loc5_);
            _loc3_++;
         }
         this.var_162.populate(_loc1_);
         this.var_162.selection = 0;
      }
      
      private function onFilterSelected(param1:WindowEvent) : void
      {
         this.startSearch();
      }
      
      private function startSearch() : void
      {
         var _loc1_:int = this.var_162 == null ? 0 : int(this.var_162.selection);
         Logger.log("Event filter changed: " + _loc1_);
         this._navigator.mainViewCtrl.startSearch(Tabs.const_343,Tabs.const_506,_loc1_ < 1 ? "-1" : _loc1_ + "");
      }
      
      public function get filterCategory() : String
      {
         return !!this.var_162 ? this.var_162.enumerateSelection()[this.var_162.selection] : null;
      }
   }
}
