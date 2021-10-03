package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class PopupCtrl
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_1159:String;
      
      private var var_2338:int;
      
      private var _popupIndentLeft:int;
      
      private var var_442:Timer;
      
      private var var_373:Timer;
      
      private var var_58:IWindowContainer;
      
      public function PopupCtrl(param1:HabboNavigator, param2:int, param3:int, param4:String)
      {
         this.var_442 = new Timer(500,1);
         this.var_373 = new Timer(100,1);
         super();
         this._navigator = param1;
         this.var_1159 = param4;
         this.var_2338 = param2;
         this._popupIndentLeft = param3;
         this.var_442.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_373.addEventListener(TimerEvent.TIMER,this.onHideTimer);
      }
      
      public function get navigator() : HabboNavigator
      {
         return this._navigator;
      }
      
      public function dispose() : void
      {
         this._navigator = null;
         if(this.var_442)
         {
            this.var_442.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_442.reset();
            this.var_442 = null;
         }
         if(this.var_373)
         {
            this.var_373.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_373.reset();
            this.var_373 = null;
         }
      }
      
      public function showPopup(param1:IWindow) : void
      {
         if(this.var_58 == null)
         {
            this.var_58 = IWindowContainer(this._navigator.getXmlWindow(this.var_1159));
            this.var_58.visible = false;
            this.var_58.setParamFlag(HabboWindowParam.const_46,true);
            this.var_58.procedure = this.onPopup;
         }
         Util.hideChildren(this.var_58);
         this.refreshContent(this.var_58);
         this.var_58.height = Util.getLowestPoint(this.var_58) + 5;
         var _loc2_:Point = new Point();
         param1.getGlobalPosition(_loc2_);
         this.var_58.x = _loc2_.x + this.var_2338 + param1.width;
         this.var_58.y = _loc2_.y - this.var_58.height * 0.5 + param1.height * 0.5;
         var _loc3_:Point = new Point();
         this.var_58.getGlobalPosition(_loc3_);
         if(_loc3_.x + this.var_58.width > this.var_58.desktop.width)
         {
            this.var_58.x = -this.var_58.width + _loc2_.x + this._popupIndentLeft;
            this.refreshPopupArrows(this.var_58,false);
         }
         else
         {
            this.refreshPopupArrows(this.var_58,true);
         }
         if(!this.var_58.visible)
         {
            this.var_442.reset();
            this.var_442.start();
         }
         this.var_373.reset();
         this.var_58.activate();
      }
      
      public function closePopup() : void
      {
         this.var_373.reset();
         this.var_442.reset();
         this.var_373.start();
      }
      
      private function refreshPopupArrows(param1:IWindowContainer, param2:Boolean) : void
      {
         this.refreshPopupArrow(param1,true,param2);
         this.refreshPopupArrow(param1,false,!param2);
      }
      
      private function refreshPopupArrow(param1:IWindowContainer, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:String = "popup_arrow_" + (!!param2 ? "left" : "right");
         var _loc5_:IBitmapWrapperWindow = IBitmapWrapperWindow(param1.findChildByName(_loc4_));
         if(!param3)
         {
            if(_loc5_ != null)
            {
               _loc5_.visible = false;
            }
         }
         else
         {
            if(_loc5_ == null)
            {
               _loc5_ = this._navigator.getButton(_loc4_,_loc4_,null);
               _loc5_.setParamFlag(HabboWindowParam.const_63,false);
               param1.addChild(_loc5_);
            }
            _loc5_.visible = true;
            _loc5_.y = param1.height * 0.5 - _loc5_.height * 0.5;
            _loc5_.x = !!param2 ? int(1 - _loc5_.width) : int(param1.width - 1);
         }
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.var_58.visible = true;
         this.var_58.activate();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         if(this.var_58 != null)
         {
            this.var_58.visible = false;
         }
      }
      
      public function hideInstantly() : void
      {
         if(this.var_58 != null)
         {
            this.var_58.visible = false;
         }
         this.var_442.reset();
         this.var_373.reset();
      }
      
      public function get visible() : Boolean
      {
         return this.var_58 != null && this.var_58.visible;
      }
      
      public function refreshContent(param1:IWindowContainer) : void
      {
      }
      
      private function onPopup(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 as WindowMouseEvent == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_373.reset();
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!Util.containsMouse(this.var_58))
            {
               this.closePopup();
            }
         }
      }
   }
}
