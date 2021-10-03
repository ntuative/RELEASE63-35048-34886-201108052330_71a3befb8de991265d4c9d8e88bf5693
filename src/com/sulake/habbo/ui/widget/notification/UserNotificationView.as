package com.sulake.habbo.ui.widget.notification
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserNotificationView implements IDisposable
   {
      
      protected static const const_2080:String = "button_ok";
      
      protected static const const_2081:String = "text_title";
      
      protected static const DESCRIPTION_NAME:String = "text_description";
      
      protected static const const_2367:String = "widget_notification_frame";
       
      
      private var _widget:UserNotificationWidget;
      
      private var _disposed:Boolean = false;
      
      private var var_669:Array;
      
      public function UserNotificationView(param1:UserNotificationWidget)
      {
         super();
         this._widget = param1;
         this.var_669 = new Array();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_669)
            {
               while(this.var_669.length > 0)
               {
                  this.var_669.pop().dispose();
               }
               this.var_669 = null;
            }
            this._widget = null;
            this._disposed = true;
         }
      }
      
      public function showNotification(param1:String, param2:String) : Boolean
      {
         var title:String = param1;
         var description:String = param2;
         var asset:XmlAsset = this._widget.assets.getAssetByName("notification") as XmlAsset;
         if(!asset)
         {
            return false;
         }
         var xml:XML = XML(asset.content);
         var dialog:IFrameWindow = IFrameWindow(this._widget.windowManager.buildFromXML(xml));
         if(!dialog)
         {
            return false;
         }
         dialog.caption = title;
         dialog.findChildByName(const_2081).caption = title;
         dialog.findChildByName(DESCRIPTION_NAME).caption = description;
         dialog.center();
         dialog.findChildByName(const_2080).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,function(param1:WindowMouseEvent):void
         {
            hideNotification(IFrameWindow(param1.window.host));
         });
         dialog.findChildByName("header_button_close").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,function(param1:WindowMouseEvent):void
         {
            hideNotification(IFrameWindow(param1.window.host));
         });
         this.var_669.push(dialog);
         return true;
      }
      
      public function hideNotification(param1:IFrameWindow) : void
      {
         var _loc2_:int = 0;
         if(param1 != null)
         {
            _loc2_ = this.var_669.indexOf(param1);
            if(_loc2_ > -1)
            {
               this.var_669.splice(_loc2_,1);
            }
            param1.dispose();
         }
      }
   }
}
