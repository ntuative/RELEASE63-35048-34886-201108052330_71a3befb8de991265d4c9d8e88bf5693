package com.sulake.habbo.ui.widget.effects
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class EffectView
   {
       
      
      private const const_2392:int = 1000;
      
      private var _widget:EffectsWidget;
      
      private var _window:IWindowContainer;
      
      private var var_111:IWidgetAvatarEffect;
      
      private var var_681:IWindow;
      
      private var var_349:Number;
      
      private var var_402:ITextWindow;
      
      private var var_226:Timer;
      
      private var var_682:IWindow;
      
      public function EffectView(param1:EffectsWidget, param2:IWidgetAvatarEffect)
      {
         super();
         this.var_111 = param2;
         this._widget = param1;
         this.var_226 = new Timer(this.const_2392);
         this.var_226.addEventListener(TimerEvent.TIMER,this.onUpdate);
         this.update();
      }
      
      public function get effect() : IWidgetAvatarEffect
      {
         return this.var_111;
      }
      
      public function dispose() : void
      {
         if(this.var_226 != null)
         {
            this.var_226.stop();
            this.var_226.removeEventListener(TimerEvent.TIMER,this.onUpdate);
            this.var_226 = null;
         }
         this._widget = null;
         this.var_111 = null;
         this.var_681 = null;
         this.var_402 = null;
         this.var_682 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         if(this.var_681 == null)
         {
            this.var_226.stop();
            return;
         }
         if(this.var_111.isActive)
         {
            _loc2_ = this.var_111.secondsLeft / Number(this.var_111.duration);
            this.var_681.width = _loc2_ * this.var_349;
         }
         else
         {
            this.var_681.width = 0;
            this.var_226.stop();
         }
         this.setTimeLeft();
      }
      
      private function setTimeLeft() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this.var_402 == null)
         {
            this.var_402 = this._window.findChildByName("time_left") as ITextWindow;
            if(this.var_402 == null)
            {
               return;
            }
         }
         if(!this.var_111.isActive)
         {
            this.var_402.caption = "${widgets.memenu.effects.activate}";
            return;
         }
         if(this.var_111.secondsLeft > 86400)
         {
            this.var_402.caption = "${widgets.memenu.effects.active.daysleft}";
            _loc1_ = this.var_402.text;
            _loc2_ = Math.floor(this.var_111.secondsLeft / 86400);
            _loc1_ = _loc1_.replace("%days_left%",_loc2_);
         }
         else
         {
            this.var_402.caption = "${widgets.memenu.effects.active.timeleft}";
            _loc1_ = this.var_402.text;
            _loc3_ = this.var_111.secondsLeft;
            _loc4_ = Math.floor(_loc3_ / 3600);
            _loc5_ = Math.floor(_loc3_ / 60) % 60;
            _loc6_ = _loc3_ % 60;
            _loc7_ = _loc4_ < 10 ? "0" : "";
            _loc8_ = _loc5_ < 10 ? "0" : "";
            _loc9_ = _loc6_ < 10 ? "0" : "";
            if(_loc4_ > 0)
            {
               _loc1_ = _loc1_.replace("%time_left%",_loc7_ + _loc4_ + ":" + _loc8_ + _loc5_ + ":" + _loc9_ + _loc6_);
            }
            else
            {
               _loc1_ = _loc1_.replace("%time_left%",_loc8_ + _loc5_ + ":" + _loc9_ + _loc6_);
            }
         }
         this.var_402.text = _loc1_;
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(!this._window)
         {
            this._window = this._widget.windowManager.createWindow("","",HabboWindowType.const_74,HabboWindowStyle.const_30,HabboWindowParam.const_63) as IWindowContainer;
         }
         while(this._window.numChildren > 0)
         {
            _loc7_ = this._window.removeChildAt(0);
            _loc7_.dispose();
         }
         this.var_681 = null;
         this.var_682 = null;
         this.var_402 = null;
         var _loc2_:String = "";
         if(this.var_111.isInUse)
         {
            _loc2_ = "memenu_effect_selected";
         }
         else if(this.var_111.isActive)
         {
            _loc2_ = "memenu_effect_unselected";
         }
         else
         {
            _loc2_ = "memenu_effect_inactive";
         }
         _loc1_ = this._widget.assets.getAssetByName(_loc2_) as XmlAsset;
         var _loc3_:IWindowContainer = this._widget.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         this._window.addChild(_loc3_);
         var _loc4_:ITextWindow = this._window.findChildByName("effect_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.caption = "${fx_" + this.var_111.type + "}";
         }
         var _loc5_:ITextWindow = this._window.findChildByName("effect_amount") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc5_.caption = this.var_111.effectsInInventory + "";
         }
         var _loc6_:IWindowContainer = this._window.findChildByName("effect_amount_bg1") as IWindowContainer;
         if(this.var_111.effectsInInventory < 2)
         {
            if(_loc6_ != null)
            {
               _loc6_.visible = false;
            }
         }
         if(_loc2_ == "memenu_effect_inactive")
         {
            _loc8_ = this._window.findChildByName("activate_effect") as IButtonWindow;
            if(_loc8_ != null)
            {
               _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            }
         }
         else
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
            if(this.var_111.isActive)
            {
               _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onMouseEvent);
               _loc3_.addEventListener(WindowMouseEvent.const_25,this.onMouseEvent);
            }
            if(this.var_111.isInUse)
            {
               this.setElementImage("effect_hilite","memenu_fx_pause");
            }
            else
            {
               this.setElementImage("effect_hilite","memenu_fx_play");
            }
            this.var_682 = this._window.findChildByName("effect_hilite");
            this.var_682.visible = false;
         }
         this.setTimeLeft();
         this.var_681 = this._window.findChildByName("loader_bar");
         if(this.var_681 != null)
         {
            this.var_349 = this.var_681.width;
            this.var_226.start();
            this.onUpdate();
         }
         if(this.var_111.icon)
         {
            this.setElementBitmap("effect_icon",this.var_111.icon);
         }
         this._window.rectangle = _loc3_.rectangle;
      }
      
      private function setElementBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            if(_loc3_.bitmap)
            {
               _loc3_.bitmap.dispose();
            }
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
            _loc3_.bitmap.copyPixels(param2,param2.rect,new Point(0,0));
         }
         else
         {
            Logger.log("Could not find element: " + param1);
         }
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(this.var_682 != null)
               {
                  this.var_682.visible = true;
               }
               break;
            case WindowMouseEvent.const_25:
               if(this.var_682 != null)
               {
                  this.var_682.visible = false;
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               this._widget.selectEffect(this.var_111.type,this.var_111.isInUse);
         }
      }
      
      private function setElementImage(param1:String, param2:String) : void
      {
         var _loc3_:BitmapDataAsset = this._widget.assets.getAssetByName(param2) as BitmapDataAsset;
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         this.setElementBitmap(param1,_loc4_);
      }
   }
}
