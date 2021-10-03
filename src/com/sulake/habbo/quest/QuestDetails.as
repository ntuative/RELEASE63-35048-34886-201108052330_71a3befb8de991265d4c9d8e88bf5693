package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import flash.geom.Point;
   
   public class QuestDetails implements IDisposable
   {
      
      private static const const_1620:int = 56;
      
      private static const const_486:int = 5;
      
      private static const const_1686:int = 5;
      
      private static const const_1138:Point = new Point(8,8);
      
      private static const const_1687:Array = ["PLACE_ITEM","PLACE_FLOOR","PLACE_WALLPAPER","PET_DRINK","PET_EAT"];
       
      
      private var var_51:HabboQuestEngine;
      
      private var _window:IFrameWindow;
      
      private var var_2130:Boolean;
      
      private var var_142:QuestMessageData;
      
      private var var_1528:int;
      
      public function QuestDetails(param1:HabboQuestEngine)
      {
         super();
         this.var_51 = param1;
      }
      
      public function dispose() : void
      {
         this.var_51 = null;
         this.var_142 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_51 == null;
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         if(this.var_2130)
         {
            this.var_2130 = false;
            this.showDetails(param1);
         }
         else if(this.var_142 == null || this.var_142.id != param1.id)
         {
            this.close();
         }
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.close();
      }
      
      public function onQuestCancelled() : void
      {
         this.close();
      }
      
      public function onRoomExit() : void
      {
         this.close();
      }
      
      private function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function showDetails(param1:QuestMessageData) : void
      {
         if(this._window && this._window.visible)
         {
            this._window.visible = false;
            return;
         }
         this.openDetails(param1);
      }
      
      private function openDetails(param1:QuestMessageData) : void
      {
         var _loc8_:* = null;
         this.var_142 = param1;
         if(param1 == null)
         {
            return;
         }
         if(this._window == null)
         {
            this._window = IFrameWindow(this.var_51.getXmlWindow("QuestDetails"));
            this._window.findChildByTag("close").procedure = this.onDetailsWindowClose;
            this._window.center();
            _loc8_ = this.var_51.questController.questsList.createListEntry();
            _loc8_.x = const_1138.x;
            _loc8_.y = const_1138.y;
            this._window.content.addChild(_loc8_);
            this._window.findChildByName("link_region").procedure = this.onLinkProc;
         }
         _loc8_ = IWindowContainer(this._window.findChildByName("entry_container"));
         this.var_51.questController.questsList.refreshEntryDetails(_loc8_,param1);
         var _loc2_:* = this.var_142.waitPeriodSeconds > 0;
         var _loc3_:ITextWindow = ITextWindow(_loc8_.findChildByName("hint_txt"));
         var _loc4_:int = this.getTextHeight(_loc3_);
         if(!_loc2_)
         {
            _loc3_.caption = this.var_51.getQuestHint(param1);
            _loc3_.height = _loc3_.textHeight + const_1686;
         }
         _loc3_.visible = !_loc2_;
         var _loc5_:int = this.getTextHeight(_loc3_) - _loc4_;
         var _loc6_:int = this.setupLink("link_region",_loc3_.y + _loc3_.height + const_486);
         var _loc7_:IWindowContainer = IWindowContainer(_loc8_.findChildByName("quest_container"));
         _loc7_.height += _loc5_ + _loc6_;
         this.var_51.questController.questsList.setEntryHeight(_loc8_);
         this._window.height = _loc8_.height + const_1620;
         this._window.visible = true;
         this._window.activate();
      }
      
      private function setupLink(param1:String, param2:int) : int
      {
         var _loc3_:Boolean = this.hasCatalogLink();
         var _loc4_:Boolean = this.hasNavigatorLink();
         var _loc5_:Boolean = _loc3_ || _loc4_;
         var _loc6_:IRegionWindow = IRegionWindow(this._window.findChildByName(param1));
         _loc6_.y = param2;
         var _loc7_:int = 0;
         if(_loc5_ && !_loc6_.visible)
         {
            _loc7_ = const_486 + _loc6_.height;
         }
         if(!_loc5_ && _loc6_.visible)
         {
            _loc7_ = -const_486 - _loc6_.height;
         }
         _loc6_.visible = _loc5_;
         _loc6_.findChildByName("link_catalog").visible = _loc3_;
         _loc6_.findChildByName("link_navigator").visible = _loc4_;
         return _loc7_;
      }
      
      private function hasCatalogLink() : Boolean
      {
         return this.var_142.waitPeriodSeconds < 1 && const_1687.indexOf(this.var_142.type) > -1;
      }
      
      private function hasNavigatorLink() : Boolean
      {
         var _loc1_:Boolean = this.var_51.localization.hasKey(this.var_142.getCampaignLocalizationKey() + ".searchtag");
         var _loc2_:Boolean = this.var_51.localization.hasKey(this.var_142.getCampaignLocalizationKey() + ".searchtag");
         return this.var_142.waitPeriodSeconds < 1 && (_loc1_ || _loc2_);
      }
      
      private function getTextHeight(param1:ITextWindow) : int
      {
         return !!param1.visible ? int(param1.height) : 0;
      }
      
      private function onDetailsWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._window.visible = false;
         }
      }
      
      public function set openForNextQuest(param1:Boolean) : void
      {
         this.var_2130 = param1;
      }
      
      private function onLinkProc(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(this.hasCatalogLink())
            {
               this.var_51.openCatalog(this.var_142);
            }
            else if(this.hasNavigatorLink())
            {
               this.var_51.openNavigator(this.var_142);
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         if(this._window == null || !this._window.visible)
         {
            return;
         }
         this.var_1528 -= param1;
         if(this.var_1528 > 0)
         {
            return;
         }
         this.var_1528 = NextQuestTimer.const_743;
         var _loc2_:Boolean = this.var_51.questController.questsList.refreshDelay(this._window,this.var_142);
         if(_loc2_)
         {
            this.openDetails(this.var_142);
         }
      }
   }
}
