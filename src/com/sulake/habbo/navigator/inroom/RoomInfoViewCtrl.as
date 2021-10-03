package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_194:IWindowContainer;
      
      private var var_3118:int;
      
      private var var_406:RoomEventViewCtrl;
      
      private var var_403:Timer;
      
      private var var_153:RoomSettingsCtrl;
      
      private var var_297:RoomThumbnailCtrl;
      
      private var var_1075:TagRenderer;
      
      private var var_405:IWindowContainer;
      
      private var var_404:IWindowContainer;
      
      private var var_687:IWindowContainer;
      
      private var var_1983:IWindowContainer;
      
      private var var_1982:IWindowContainer;
      
      private var var_1312:IWindowContainer;
      
      private var var_1067:ITextWindow;
      
      private var var_1072:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_865:ITextWindow;
      
      private var var_1315:ITextWindow;
      
      private var var_1073:ITextWindow;
      
      private var var_866:ITextWindow;
      
      private var var_1595:ITextWindow;
      
      private var var_296:IWindowContainer;
      
      private var var_862:IWindowContainer;
      
      private var var_1597:IWindowContainer;
      
      private var var_1984:ITextWindow;
      
      private var var_688:ITextWindow;
      
      private var var_1985:IWindow;
      
      private var var_1314:IContainerButtonWindow;
      
      private var var_1313:IContainerButtonWindow;
      
      private var var_1316:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1311:IContainerButtonWindow;
      
      private var var_1599:IButtonWindow;
      
      private var var_1598:IButtonWindow;
      
      private var var_1600:IButtonWindow;
      
      private var var_863:IWindowContainer;
      
      private var var_1317:ITextWindow;
      
      private var var_1074:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_864:IButtonWindow;
      
      private var var_1596:Boolean = false;
      
      private const const_967:int = 75;
      
      private const const_832:int = 3;
      
      private const const_1008:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_406 = new RoomEventViewCtrl(this._navigator);
         this.var_153 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_297 = new RoomThumbnailCtrl(this._navigator);
         this.var_1075 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_153);
         this.var_403 = new Timer(6000,1);
         this.var_403.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_403)
         {
            this.var_403.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_403.reset();
            this.var_403 = null;
         }
         this._navigator = null;
         this.var_406 = null;
         this.var_153 = null;
         this.var_297 = null;
         if(this.var_1075)
         {
            this.var_1075.dispose();
            this.var_1075 = null;
         }
         this.var_194 = null;
         this.var_405 = null;
         this.var_404 = null;
         this.var_687 = null;
         this.var_1983 = null;
         this.var_1982 = null;
         this.var_1312 = null;
         this.var_1067 = null;
         this.var_1072 = null;
         this._ownerName = null;
         this.var_865 = null;
         this.var_1315 = null;
         this.var_1073 = null;
         this.var_866 = null;
         this.var_1595 = null;
         this.var_296 = null;
         this.var_862 = null;
         this.var_1597 = null;
         this.var_1984 = null;
         this.var_688 = null;
         this.var_1985 = null;
         this.var_1314 = null;
         this.var_1313 = null;
         this.var_1316 = null;
         this._remFavouriteButton = null;
         this.var_1311 = null;
         this.var_1599 = null;
         this.var_1598 = null;
         this.var_1600 = null;
         this.var_863 = null;
         this.var_1317 = null;
         this.var_1074 = null;
         this._buttons = null;
         this.var_864 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_403.reset();
         this.var_406.active = true;
         this.var_153.active = false;
         this.var_297.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_403.reset();
         this.var_153.load(param1);
         this.var_153.active = true;
         this.var_406.active = false;
         this.var_297.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_153.active = true;
         this.var_406.active = false;
         this.var_297.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_403.reset();
         this.var_153.active = false;
         this.var_406.active = false;
         this.var_297.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1596 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_403.reset();
         this.var_406.active = false;
         this.var_153.active = false;
         this.var_297.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_832;
         this._window.y = this.const_967;
         if(this._navigator.configuration.getBoolean("club.membership.extend.vip.promotion.enabled",false) || this._navigator.configuration.getBoolean("club.membership.extend.basic.promotion.enabled",false))
         {
            this._window.y = 91;
         }
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_194,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_194.height = Util.getLowestPoint(this.var_194);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_1008;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_405);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_153.refresh(this.var_405);
         this.var_297.refresh(this.var_405);
         Util.moveChildrenToColumn(this.var_405,["room_details","room_buttons"],0,2);
         this.var_405.height = Util.getLowestPoint(this.var_405);
         this.var_405.visible = true;
         Logger.log("XORP: " + this.var_404.visible + ", " + this.var_1312.visible + ", " + this.var_687.visible + ", " + this.var_687.rectangle + ", " + this.var_405.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_296);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_406.refresh(this.var_296);
         if(Util.hasVisibleChildren(this.var_296) && !(this.var_153.active || this.var_297.active))
         {
            Util.moveChildrenToColumn(this.var_296,["event_details","event_buttons"],0,2);
            this.var_296.height = Util.getLowestPoint(this.var_296);
            this.var_296.visible = true;
         }
         else
         {
            this.var_296.visible = false;
         }
         Logger.log("EVENT: " + this.var_296.visible + ", " + this.var_296.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","RoomWidgetChatSelectAvatarMessage") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_153.active && !this.var_297.active && !this.var_406.active)
         {
            this.var_863.visible = true;
            this.var_1074.text = this.getEmbedData();
         }
         else
         {
            this.var_863.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_153.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_864)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_864.visible = _loc1_;
            if(this.var_1596)
            {
               this.var_864.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_864.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_153.active || this.var_297.active)
         {
            return;
         }
         this.var_1067.text = param1.roomName;
         this.var_1067.height = this.var_1067.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_865.text = param1.description;
         this.var_1075.refreshTags(this.var_404,param1.tags);
         this.var_865.visible = false;
         if(param1.description != "")
         {
            this.var_865.height = this.var_865.textHeight + 5;
            this.var_865.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1313,"facebook_logo_small",_loc3_,null,0);
         this.var_1313.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1314,"thumb_up",_loc4_,null,0);
         this.var_1314.visible = _loc4_;
         this.var_866.visible = !_loc4_;
         this.var_1595.visible = !_loc4_;
         this.var_1595.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_404,"home",param2,null,0);
         this._navigator.refreshButton(this.var_404,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_404,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_1067.y,0);
         this.var_404.visible = true;
         this.var_404.height = Util.getLowestPoint(this.var_404);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_404.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_153.active || this.var_297.active)
         {
            return;
         }
         this.var_1072.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1072.height = this.var_1072.textHeight + 5;
         this.var_1315.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1315.height = this.var_1315.textHeight + 5;
         Util.moveChildrenToColumn(this.var_687,["public_space_name","public_space_desc"],this.var_1072.y,0);
         this.var_687.visible = true;
         this.var_687.height = Math.max(86,Util.getLowestPoint(this.var_687));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_406.active)
         {
            return;
         }
         this.var_1984.text = param1.eventName;
         this.var_688.text = param1.eventDescription;
         this.var_1075.refreshTags(this.var_862,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_688.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_688.height = this.var_688.textHeight + 5;
            this.var_688.y = Util.getLowestPoint(this.var_862) + 2;
            this.var_688.visible = true;
         }
         this.var_862.visible = true;
         this.var_862.height = Util.getLowestPoint(this.var_862);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_153.active || this.var_297.active)
         {
            return;
         }
         this.var_1599.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1316.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1311.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1312.visible = Util.hasVisibleChildren(this.var_1312);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_406.active)
         {
            return;
         }
         this.var_1598.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1600.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1597.visible = Util.hasVisibleChildren(this.var_1597);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_194 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_405 = IWindowContainer(this.find("room_info"));
         this.var_404 = IWindowContainer(this.find("room_details"));
         this.var_687 = IWindowContainer(this.find("public_space_details"));
         this.var_1983 = IWindowContainer(this.find("owner_name_cont"));
         this.var_1982 = IWindowContainer(this.find("rating_cont"));
         this.var_1312 = IWindowContainer(this.find("room_buttons"));
         this.var_1067 = ITextWindow(this.find("room_name"));
         this.var_1072 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_865 = ITextWindow(this.find("room_desc"));
         this.var_1315 = ITextWindow(this.find("public_space_desc"));
         this.var_1073 = ITextWindow(this.find("owner_caption"));
         this.var_866 = ITextWindow(this.find("rating_caption"));
         this.var_1595 = ITextWindow(this.find("rating_txt"));
         this.var_296 = IWindowContainer(this.find("event_info"));
         this.var_862 = IWindowContainer(this.find("event_details"));
         this.var_1597 = IWindowContainer(this.find("event_buttons"));
         this.var_1984 = ITextWindow(this.find("event_name"));
         this.var_688 = ITextWindow(this.find("event_desc"));
         this.var_1313 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1314 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1985 = this.find("staff_pick_button");
         this.var_1316 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1311 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1599 = IButtonWindow(this.find("room_settings_button"));
         this.var_1598 = IButtonWindow(this.find("create_event_button"));
         this.var_1600 = IButtonWindow(this.find("edit_event_button"));
         this.var_863 = IWindowContainer(this.find("embed_info"));
         this.var_1317 = ITextWindow(this.find("embed_info_txt"));
         this.var_1074 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_864 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1316,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1599,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1311,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1598,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1600,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1074,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1314,this.onThumbUp);
         this.addMouseClickListener(this.var_1985,this.onStaffPick);
         this.addMouseClickListener(this.var_1313,this.onFacebookLike);
         this.addMouseClickListener(this.var_864,this.onZoomClick);
         this._navigator.refreshButton(this.var_1316,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1311,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_405,this.onHover);
         this.addMouseOverListener(this.var_296,this.onHover);
         this.var_1073.width = this.var_1073.textWidth;
         Util.moveChildrenToRow(this.var_1983,["owner_caption","owner_name"],this.var_1073.x,this.var_1073.y,3);
         this.var_866.width = this.var_866.textWidth;
         Util.moveChildrenToRow(this.var_1982,["rating_caption","rating_txt"],this.var_866.x,this.var_866.y,3);
         this.var_1317.height = this.var_1317.textHeight + 5;
         Util.moveChildrenToColumn(this.var_863,["embed_info_txt","embed_src_txt"],this.var_1317.y,2);
         this.var_863.height = Util.getLowestPoint(this.var_863) + 5;
         this.var_3118 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1074.setSelection(0,this.var_1074.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_352));
         this.var_1596 = !this.var_1596;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_403.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_153 != null)
         {
            this.var_153.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
