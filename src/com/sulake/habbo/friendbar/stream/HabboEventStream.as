package com.sulake.habbo.friendbar.stream
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.EventStreamData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.EventStreamEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.GetEventStreamComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SetEventStreamingAllowedComposer;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarView;
   import com.sulake.habbo.friendbar.utils.LinkTarget;
   import com.sulake.habbo.friendbar.utils.TestMessageWrapper;
   import com.sulake.habbo.friendbar.view.*;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboEventStream extends AbstractView implements IHabboEventStream
   {
      
      private static const const_1691:String = "page_content";
      
      private static const const_1148:String = "page_welcome";
      
      private static const const_1145:String = "page_empty";
      
      private static const const_724:String = "list";
      
      private static const const_469:String = "header";
      
      private static const const_1320:String = "badge";
      
      private static const CLOSE:String = "close";
      
      private static const const_1690:String = "scroll";
      
      private static const const_1147:String = "image";
      
      private static const const_1143:String = "disable_stream";
      
      private static const ACTIVATE:String = "activate_stream";
      
      private static const const_1144:String = "see_more";
      
      private static const const_1689:uint = 0;
      
      private static const const_2123:uint = 1;
      
      private static const const_1561:uint = 4293519841;
      
      private static const const_1560:uint = 4292467926;
      
      private static const const_717:int = -2;
      
      private static const const_1693:int = -3;
      
      private static const const_1146:int = 42;
      
      private static const const_1692:int = 60000;
      
      private static const const_1688:int = 60000;
      
      private static const GENDER_LOCALIZATION_PREFIX:String = "friendbar.stream.";
       
      
      private var var_2133:int = 1;
      
      private var _window:IWindowContainer;
      
      private var var_597:Vector.<EventStreamEntity>;
      
      private var _connection:IConnection;
      
      private var var_886:Boolean = false;
      
      private var var_732:Timer;
      
      private var var_497:Timer;
      
      private var var_1117:IHabboFriendBarView;
      
      private var var_94:IHabboCommunicationManager;
      
      private var var_909:Boolean;
      
      private var var_1669:Vector.<int>;
      
      private var var_1667:Boolean = false;
      
      private var var_2936:Boolean = false;
      
      private var var_2937:Array;
      
      private var var_2935:Array;
      
      private var var_1668:Map;
      
      public function HabboEventStream(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         this.var_1669 = new Vector.<int>();
         this.var_2937 = ["friend_made","room_liked","achievement_earned","motto_changed","room_decorated"];
         this.var_2935 = ["no_link","open_mini_profile","visit_room","open_achievements","open_motto_changer","friend_request"];
         this.var_1668 = new Map();
         super(param1,param2,param3);
         this.var_597 = new Vector.<EventStreamEntity>();
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerAvailable);
         queueInterface(new IIDHabboFriendBarView(),this.onFriendBarViewAvailable);
         this.var_1668.add("m","his");
         this.var_1668.add("f","her");
         if(!this.var_497)
         {
            this.var_497 = new Timer(const_1688);
            this.var_497.addEventListener(TimerEvent.TIMER,this.onRefreshTimerEvent);
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(!this._window)
         {
            this.setupUserInterface();
         }
         this._window.visible = param1;
         if(param1)
         {
            this._window.x = this._window.desktop.width - (this._window.width + const_1693);
            this._window.y = const_717;
            this._window.height = this._window.desktop.height - (const_717 + const_1146);
            this._window.activate();
            if(this.var_909)
            {
               this.requestEventStreamData(this.var_2133);
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return !!this._window ? Boolean(this._window.visible) : false;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_732)
            {
               this.var_732.stop();
               this.var_732.removeEventListener(TimerEvent.TIMER,this.onMinuteTimerEvent);
               this.var_732 = null;
            }
            if(this.var_497)
            {
               this.var_497.stop();
               this.var_497.removeEventListener(TimerEvent.TIMER,this.onRefreshTimerEvent);
               this.var_497 = null;
            }
            while(this.var_597.length > 0)
            {
               this.var_597.pop().dispose();
            }
            if(false)
            {
               EventStreamEntity.name_6.dispose();
            }
            EventStreamEntity.name_6 = null;
            EventStreamEntity.var_2259 = null;
            EventStreamEntity.ASSETS = null;
            if(this._window)
            {
               this._window.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
               this._window.dispose();
               this._window = null;
            }
            if(this.var_94)
            {
               if(!this.var_94.disposed)
               {
                  this.var_94.release(new IIDHabboCommunicationManager());
                  this.var_94 = null;
               }
            }
            if(this.var_1117)
            {
               if(!this.var_1117.disposed)
               {
                  this.var_1117.release(new IIDHabboFriendBarView());
                  this.var_1117 = null;
               }
            }
            super.dispose();
         }
      }
      
      private function clearStreamList() : void
      {
         while(this.var_597.length > 0)
         {
            this.var_597.pop().dispose();
         }
      }
      
      public function populate(param1:Vector.<EventStreamData>) : void
      {
         var _loc2_:* = false;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(!this._window)
         {
            this.setupUserInterface();
         }
         if(this.visible)
         {
            this.clearStreamList();
            _loc2_ = this.var_597.length % 2 == 0;
            _loc4_ = this._window.findChildByName(const_724) as IItemListWindow;
            _loc5_ = 0;
            for each(_loc6_ in param1)
            {
               _loc3_ = EventStreamEntity.allocate();
               _loc3_.title = _loc6_.accountName;
               _loc3_.message = this.resolveMessageText(_loc6_);
               _loc3_.linkTarget = this.resolveLinkTarget(_loc6_);
               _loc3_.minutesElapsed = _loc6_.minutesSinceEvent;
               _loc3_.window.color = !!_loc2_ ? uint(const_1561) : uint(const_1560);
               this.resolveImagePath(_loc3_,_loc6_);
               this.var_597.push(_loc3_);
               _loc4_.addListItem(_loc3_.window);
               _loc2_ = !_loc2_;
               if(this.var_1669.indexOf(_loc6_.id) == -1)
               {
                  _loc5_++;
                  this.var_1669.push(_loc6_.id);
               }
            }
            if(param1.length == 0)
            {
            }
            _loc7_ = this._window.findChildByName(const_469) as IItemListWindow;
            _loc8_ = _loc7_.getListItemByName(const_1320);
            _loc8_.visible = false;
            this.var_1667 = false;
         }
         else
         {
            for each(_loc9_ in param1)
            {
               if(this.var_1669.indexOf(_loc9_.id) == -1)
               {
                  this.var_1667 = true;
                  break;
               }
            }
         }
         this.selectCorrectView();
      }
      
      private function resolveMessageText(param1:EventStreamData) : String
      {
         var _loc6_:* = null;
         var _loc2_:int = param1.actionId;
         var _loc3_:String = "friendbar.stream.type." + this.var_2937[_loc2_];
         var _loc4_:ILocalization = var_435.getLocalization(_loc3_);
         if(!_loc4_)
         {
            return _loc3_;
         }
         var _loc5_:String = _loc4_.raw;
         switch(_loc2_)
         {
            case EventStreamData.const_828:
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.friendName);
               break;
            case EventStreamData.const_1383:
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.roomName);
               break;
            case EventStreamData.const_955:
               _loc5_ = _loc5_.replace("%targetString%",var_435.getAchievementName(param1.extraDataStruct.achievementCode));
               break;
            case EventStreamData.const_1258:
               _loc6_ = var_435.getLocalization(GENDER_LOCALIZATION_PREFIX + this.var_1668.getValue(param1.accountGender));
               _loc5_ = _loc5_.replace("%gender%",_loc6_.value);
               _loc5_ = _loc5_.replace("%targetString%",param1.extraDataStruct.motto);
               break;
            case EventStreamData.const_1784:
         }
         return _loc5_;
      }
      
      private function resolveLinkTarget(param1:EventStreamData) : LinkTarget
      {
         var _loc3_:* = null;
         var _loc2_:String = "friendbar.stream.link." + this.var_2935[param1.linkTargetType];
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:ILocalization = var_435.getLocalization(_loc2_);
         _loc3_ = !!_loc7_ ? _loc7_.raw : "";
         switch(param1.linkTargetType)
         {
            case EventStreamData.const_2063:
               _loc4_ = 0;
               _loc3_ = "";
               break;
            case EventStreamData.const_1270:
               _loc3_ = _loc3_.replace("%targetString%",param1.extraDataStruct.friendName);
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.friendId);
               break;
            case EventStreamData.const_2001:
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.roomId);
               break;
            case EventStreamData.const_1771:
               _loc4_ = 0;
               break;
            case EventStreamData.LINK_TARGET_OPEN_MOTTO_CHANGER:
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case EventStreamData.const_1848:
               _loc3_ = _loc3_.replace("%targetString%",param1.extraDataStruct.friendName);
               _loc4_ = 0;
               _loc5_ = uint(param1.extraDataStruct.friendId);
               _loc6_ = param1.extraDataStruct.friendName;
         }
         return new LinkTarget(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      private function resolveImagePath(param1:EventStreamEntity, param2:EventStreamData) : void
      {
         var image:BitmapData = null;
         var callback:Function = null;
         var entity:EventStreamEntity = param1;
         var data:EventStreamData = param2;
         var result:String = data.imageFilePath;
         var action:int = data.actionId;
         switch(action)
         {
            case EventStreamData.const_955:
               image = var_422.requestBadgeImage(data.extraDataStruct.achievementCode);
               if(image)
               {
                  entity.image = image;
               }
               else
               {
                  callback = function(param1:BadgeImageReadyEvent):void
                  {
                     if(param1.badgeId == data.extraDataStruct.achievementCode)
                     {
                        entity.image = param1.badgeImage;
                        var_422.events.removeEventListener(BadgeImageReadyEvent.const_124,arguments.callee);
                     }
                  };
                  var_422.events.addEventListener(BadgeImageReadyEvent.const_124,callback);
               }
               break;
            default:
               entity.imageFilePath = result;
         }
      }
      
      private function setupUserInterface() : void
      {
         var scroll:IScrollbarWindow = null;
         var page:IWindowContainer = null;
         var image:IBitmapWrapperWindow = null;
         var list:IItemListWindow = null;
         var item:IWindowContainer = null;
         if(!this._window)
         {
            this._window = _windowManager.buildFromXML(assets.getAssetByName("event_stream_display_xml").content as XML) as IWindowContainer;
            this._window.height = this._window.desktop.height - (const_717 + const_1146);
            this._window.setParamFlag(WindowParam.const_327);
            this._window.setParamFlag(WindowParam.const_273);
            this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(CLOSE).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(const_1143).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(ACTIVATE).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.findChildByName(const_1144).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
            this._window.visible = false;
            scroll = this._window.findChildByName(const_1690) as IScrollbarWindow;
            if(scroll)
            {
               scroll.addEventListener(WindowEvent.const_209,function(param1:WindowEvent):void
               {
                  var _loc2_:IScrollbarWindow = param1.target as IScrollbarWindow;
                  if(_loc2_)
                  {
                     _loc2_.visible = true;
                     _loc2_.scrollable.width = _loc2_.scrollable.parent.width - _loc2_.width;
                  }
               });
               scroll.addEventListener(WindowEvent.const_237,function(param1:WindowEvent):void
               {
                  scroll.visible = false;
                  scroll.scrollable.width = scroll.scrollable.parent.width;
               });
               scroll.visible = false;
               scroll.scrollable.width = scroll.scrollable.parent.width;
            }
            page = this._window.findChildByName(const_1148) as IWindowContainer;
            image = page.findChildByName(const_1147) as IBitmapWrapperWindow;
            image.bitmap = assets.getAssetByName(image.bitmapAssetName).content as BitmapData;
            page = this._window.findChildByName(const_1145) as IWindowContainer;
            image = page.findChildByName(const_1147) as IBitmapWrapperWindow;
            image.bitmap = assets.getAssetByName(image.bitmapAssetName).content as BitmapData;
            this.selectCorrectView();
            list = this._window.findChildByName(const_724) as IItemListWindow;
            item = list.removeListItemAt(0) as IWindowContainer;
            EventStreamEntity.name_6 = item;
            EventStreamEntity.var_2259 = var_435;
            EventStreamEntity.ASSETS = assets;
            if(!this.var_732)
            {
               this.var_732 = new Timer(const_1692);
               this.var_732.addEventListener(TimerEvent.TIMER,this.onMinuteTimerEvent);
               this.var_732.start();
            }
         }
      }
      
      private function selectCorrectView() : void
      {
         var _loc1_:IWindow = this._window.findChildByName(const_1691);
         var _loc2_:IWindow = this._window.findChildByName(const_1148);
         var _loc3_:IWindow = this._window.findChildByName(const_1145);
         if(this.var_909)
         {
            _loc1_.visible = true;
            _loc2_.visible = false;
            _loc3_.visible = this.var_597.length == 0;
         }
         else
         {
            _loc1_.visible = false;
            _loc2_.visible = true;
            _loc3_.visible = false;
         }
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         switch(param1.target.name)
         {
            case CLOSE:
               this.visible = false;
               break;
            case const_1143:
               this.changeStreamState(false);
               break;
            case ACTIVATE:
               this.changeStreamState(true);
               break;
            case const_1144:
               _windowManager.alert("${catalog.alert.external.link.title}","${catalog.alert.external.link.desc}",0,null);
               HabboWebTools.openWebPage(var_761.getKey("link.friendbar.stream.settings.see.more",""));
         }
      }
      
      private function changeStreamState(param1:Boolean) : void
      {
         this.var_909 = param1;
         this.sendSetEventStreamingEnabled(param1);
         this.selectCorrectView();
         if(param1)
         {
            this.var_497.start();
            this.refreshEventStream();
         }
         else
         {
            this.var_497.stop();
         }
         Logger.log("Streaming enabled: " + param1);
      }
      
      private function onMinuteTimerEvent(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_597)
         {
            _loc2_.minutesElapsed += 1;
         }
      }
      
      private function onRefreshTimerEvent(param1:TimerEvent) : void
      {
         if(this.visible || !this.var_1667)
         {
            this.requestEventStreamData(this.var_2133);
         }
      }
      
      private function requestEventStreamData(param1:uint) : void
      {
         if(this._connection && this._connection.connected && this.var_2936)
         {
            this._connection.send(new GetEventStreamComposer(param1 == const_1689 ? 0 : int(GetEventStreamComposer.const_1981)));
            this.var_886 = true;
            Logger.log("Requested stream events in mode " + param1);
         }
      }
      
      private function onCommunicationManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_94 = param2 as IHabboCommunicationManager;
         this.var_94.addHabboConnectionMessageEvent(new EventStreamEvent(this.onEventStreamEvent));
         this.var_94.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObjectEvent));
         this._connection = this.var_94.getHabboMainConnection(this.onConnectionInstanceAvailable);
      }
      
      private function onConnectionInstanceAvailable(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      private function onEventStreamEvent(param1:EventStreamEvent) : void
      {
         this.populate(param1.events);
         this.var_1117.setStreamIconNotify(!this.visible && this.var_1667);
      }
      
      private function testEventStream(param1:int = 1) : void
      {
         var _loc2_:Vector.<EventStreamData> = new Vector.<EventStreamData>();
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_.push(new EventStreamData(_loc3_,EventStreamData.const_828,String(_loc3_ * 1000),"FooBar" + _loc3_,"m","http://d63.varoke.net/habbo-imaging/badge/b1003Xs05175s05173s091145ec244dcc5eaf54aaabf367665f39c67.gif",_loc3_,EventStreamData.const_1270,3,true,new TestMessageWrapper(["1234","Friend\'s friend" + _loc3_])));
            _loc3_++;
         }
         this.populate(_loc2_);
      }
      
      private function onFriendBarViewAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1117 = param2 as IHabboFriendBarView;
      }
      
      override protected function onConfigurationAvailable(param1:IID, param2:IUnknown) : void
      {
         super.onConfigurationAvailable(param1,param2);
         this.var_2936 = var_761.getKey("friendbar.stream.enabled","RoomWidgetChatSelectAvatarMessage") == "true";
      }
      
      private function sendSetEventStreamingEnabled(param1:Boolean) : void
      {
         if(this._connection && this._connection.connected)
         {
            this._connection.send(new SetEventStreamingAllowedComposer(param1));
         }
      }
      
      private function onUserObjectEvent(param1:UserObjectEvent) : void
      {
         this.var_909 = param1.getParser().streamPublishingAllowed;
         if(this.var_909)
         {
            this.var_497.start();
         }
         Logger.log("Stream events allowed " + this.var_909);
      }
      
      public function refreshEventStream() : void
      {
         if(this.var_909)
         {
            this.requestEventStreamData(this.var_2133);
         }
      }
   }
}
