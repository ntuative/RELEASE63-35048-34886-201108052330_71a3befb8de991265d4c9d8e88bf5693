package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_120:int = 18;
      
      private static const const_1493:int = 9;
      
      private static const const_1064:int = 10;
      
      private static const const_690:int = 25;
      
      private static const const_1496:int = 25;
      
      private static const const_1062:int = 4000;
      
      private static const const_1495:int = 6000;
      
      private static const const_1497:int = 3;
      
      private static const const_1494:int = 1;
      
      private static const const_691:int = 8;
      
      private static const const_472:int = 0;
      
      private static const const_1063:int = (const_691 + const_472) * const_120 + const_120;
      
      private static const const_471:int = 9;
      
      private static const const_1492:int = 40;
       
      
      private var var_1196:int = 0;
      
      private var var_980:int = 0;
      
      private var var_41:IWindowContainer;
      
      private var var_378:IItemListWindow;
      
      private var var_126:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_79:Array;
      
      private var var_278:Array;
      
      private var var_2412:int;
      
      private var var_2410:int = 0;
      
      private var var_785:Number = 1;
      
      private var _baseUrl:String;
      
      private var var_979:Number = 1;
      
      private var var_1787:Number = 0;
      
      private var var_786:Point;
      
      private var var_30:RoomChatHistoryViewer;
      
      private var var_978:Boolean = false;
      
      private var var_1786:Boolean = false;
      
      private var var_22:Component = null;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_2411:int = 150;
      
      private var var_245:int = 171.0;
      
      private var var_981:int = 18;
      
      private var var_3102:int = 100;
      
      private var var_3101:int = 195;
      
      public function RoomChatWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IHabboConfigurationManager, param6:int, param7:Component)
      {
         this._itemList = new Array();
         this.var_79 = new Array();
         this.var_278 = new Array();
         this.var_786 = new Point();
         super(param1,param2,param3,param4);
         this._config = param5;
         this.var_2412 = param6;
         this.var_41 = param2.createWindow("chat_container","",HabboWindowType.const_74,HabboWindowStyle.const_30,HabboWindowParam.const_45,new Rectangle(0,0,200,this.var_245 + RoomChatHistoryPulldown.const_91),null,0) as IWindowContainer;
         this.var_41.background = true;
         this.var_41.color = 33554431;
         this.var_41.tags.push("room_widget_chat");
         this.var_378 = param2.createWindow("chat_contentlist","",HabboWindowType.const_1199,HabboWindowStyle.const_45,0 | 0,new Rectangle(0,0,200,this.var_245),null,0) as IItemListWindow;
         this.var_41.addChild(this.var_378);
         this.var_126 = param2.createWindow("chat_active_content","",HabboWindowType.const_74,HabboWindowStyle.const_45,HabboWindowParam.const_63,new Rectangle(0,0,200,this.var_245),null,0) as IWindowContainer;
         this.var_126.clipping = false;
         this.var_378.addListItem(this.var_126);
         this.var_30 = new RoomChatHistoryViewer(this,param2,this.var_41,param3);
         this._baseUrl = param5.getKey("site.url");
         this.var_2411 = int(param5.getKey("chat.history.item.max.count","150"));
         var _loc8_:Boolean = param5.getBoolean("chat.history.disabled",false);
         if(this.var_30 != null)
         {
            this.var_30.disabled = _loc8_;
         }
         if(param7 != null)
         {
            this.var_22 = param7;
            this.var_22.registerUpdateReceiver(this,1);
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_41;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         while(this.var_278.length > 0)
         {
            _loc1_ = this.var_278.shift();
         }
         this.var_30.dispose();
         this.var_30 = null;
         while(this._itemList.length > 0)
         {
            _loc1_ = this._itemList.shift();
            _loc1_.dispose();
         }
         while(this.var_79.length > 0)
         {
            _loc1_ = this.var_79.shift();
            _loc1_.dispose();
         }
         this.var_41.dispose();
         if(this.var_22 != null)
         {
            this.var_22.removeUpdateReceiver(this);
            this.var_22 = null;
         }
         super.dispose();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > this.var_1196 && this.var_1196 > 0)
         {
            this.var_1196 = -1;
            this.animationStart();
         }
         if(this.var_978)
         {
            _loc2_ = param1 / const_1496 * const_1497;
            if(_loc2_ + this.var_980 > this.var_981)
            {
               _loc2_ = this.var_981 - this.var_980;
            }
            if(_loc2_ > 0)
            {
               this.moveItemsUp(_loc2_);
               this.var_980 += _loc2_;
            }
            if(this.var_980 >= this.var_981)
            {
               this.var_981 = const_120;
               this.var_980 = 0;
               this.animationStop();
               this.processBuffer();
               this.var_1196 = getTimer() + const_1062;
            }
         }
         if(this.var_30 != null)
         {
            this.var_30.update(param1);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_882,this.onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_559,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_780,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_772,this.onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_882,this.onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_559,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_780,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_772,this.onRoomViewUpdate);
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,this.getFreeItemId(),localizations,this._baseUrl);
         _loc2_.define(param1);
         if(this.var_979 != 1)
         {
            _loc2_.senderX /= this.var_979;
         }
         _loc2_.senderX -= this.var_786.x;
         this.setChatItemLocHorizontal(_loc2_);
         this.var_79.push(_loc2_);
         this.processBuffer();
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(this.var_1787 == 0)
            {
               this.var_1787 = param1.scale;
            }
            else
            {
               this.var_979 = param1.scale / this.var_1787;
            }
         }
         if(param1.positionDelta != null)
         {
            this.var_786.x += param1.positionDelta.x / this.var_979;
            this.var_786.y += param1.positionDelta.y / this.var_979;
         }
         if(param1.rect != null)
         {
            if(this.var_30 == null)
            {
               return;
            }
            this.var_41.width = _loc2_.width;
            this.var_41.height = this.var_245 + this.var_30.pulldownBarHeight;
            this.var_378.width = this.var_41.width - this.var_30.scrollbarWidth;
            this.var_378.height = this.var_245;
            this.var_378.x = this.var_41.x;
            this.var_378.y = this.var_41.y;
            this.var_126.width = this.var_41.width - this.var_30.scrollbarWidth;
            this.var_126.height = this.var_245;
            if(this.historyViewerActive())
            {
               this.reAlignItemsToHistoryContent();
            }
            this.var_30.containerResized(this.var_41.rectangle,true);
         }
         this.alignItems();
      }
      
      private function processBuffer() : void
      {
         if(this.var_978)
         {
            return;
         }
         if(this.var_79.length == 0)
         {
            return;
         }
         while(this.var_79.length > const_1494 || this.historyViewerActive() && this.var_79.length > 0)
         {
            this.activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(this._itemList.length == 0)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = this.checkLastItemAllowsAdding(this.var_79[0]);
         }
         if(_loc1_)
         {
            this.activateItemFromBuffer();
            this.var_1196 = getTimer() + const_1062;
         }
         else
         {
            if(this._itemList.length > 0 && this.var_79.length > 0)
            {
               this.var_981 = this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_79[0]);
            }
            else
            {
               this.var_981 = const_120;
            }
            this.animationStart();
         }
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_79.length == 0)
         {
            return;
         }
         if(this.historyViewerMinimized())
         {
            this.resetArea();
            this.hideHistoryViewer();
         }
         if(!this.checkLastItemAllowsAdding(this.var_79[0]))
         {
            this.selectItemsToMove();
            this.moveItemsUp(this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_79[0]));
            if(!this.checkLastItemAllowsAdding(this.var_79[0]))
            {
               this.var_126.height += const_120;
               if(this.var_30 != null)
               {
                  this.var_30.containerResized(this.var_41.rectangle);
               }
            }
         }
         _loc1_ = this.var_79.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               this.var_126.addChild(_loc2_);
               _loc1_.timeStamp = new Date().time;
               this._itemList.push(_loc1_);
               _loc3_ = 0;
               if(this._itemList.length > 1)
               {
                  _loc3_ = this._itemList[this._itemList.length - 2].screenLevel;
                  if(this.historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(this.var_785,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = this.var_785;
               if(_loc1_.aboveLevels > const_691 + const_472 + 2)
               {
                  _loc1_.aboveLevels = const_691 + const_472 + 2;
               }
               this.var_785 = 0;
               this.setChatItemLocHorizontal(_loc1_);
               this.setChatItemLocVertical(_loc1_);
               this.setChatItemRenderable(_loc1_);
            }
         }
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(this._itemList.length == 0)
         {
            return true;
         }
         var _loc2_:RoomChatItem = this._itemList[this._itemList.length - 1];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(this.var_126.rectangle.bottom - (this.var_126.y + _loc2_.y + _loc2_.height) <= this.getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_30 == null)
         {
            return;
         }
         _loc1_ = this._itemList.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
               this.setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < this._itemList.length)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.var_79.length)
         {
            _loc2_ = this.var_79[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function animationStart() : void
      {
         if(this.var_978)
         {
            return;
         }
         this.selectItemsToMove();
         this.var_978 = true;
      }
      
      private function animationStop() : void
      {
         this.var_978 = false;
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(this.var_978)
         {
            return;
         }
         this.purgeItems();
         this.var_278 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(this._itemList.length == 0)
         {
            this.var_785 = 1;
            return;
         }
         if(this.historyViewerActive())
         {
            return;
         }
         ++this.var_785;
         var _loc3_:int = this._itemList.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this._itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_472 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timeStamp >= const_1495)
               {
                  _loc4_.timeStamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  this.var_278.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(this.var_278 == null)
         {
            return;
         }
         if(this.var_278.length == 0)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = this.var_278.length - 1;
         while(_loc5_ >= 0)
         {
            _loc2_ = this.var_278[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = this._itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(this.historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(this._itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - this._itemList[_loc4_ - 1].y < this.getItemSpacing(this._itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || this.var_30 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + this.var_786.x) * this.var_979;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = -this.var_41.width / 2 - const_1064 + this.var_3102;
         var _loc6_:Number = this.var_41.width / 2 + const_1064 - this.var_30.scrollbarWidth - this.var_3101;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + this.var_41.width / 2 + this.var_41.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = this._itemList.indexOf(param1);
            _loc3_ = !!this.historyViewerActive() ? 0 : Number(this.var_785);
            if(_loc2_ == this._itemList.length - 1)
            {
               param1.y = this.getAreaBottom() - (_loc3_ + 1) * const_120 - const_471;
            }
            else
            {
               _loc4_ = this._itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = this._itemList[_loc2_ + 1].y - this.getItemSpacing(param1,this._itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = this._itemList[_loc2_ + 1].y - _loc4_ * const_120;
               }
            }
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_690)
            {
               if(param1.view != null)
               {
                  this.var_126.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  this.var_126.addChild(param1.view);
               }
            }
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_120;
               }
               else
               {
                  _loc2_ += this.getItemSpacing(this._itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_120;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getAreaBottom() : Number
      {
         if(this.historyViewerActive())
         {
            return this.var_126.height;
         }
         return this.var_245 + this.var_41.y;
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_120;
         }
         return const_1493;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(this.historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(this._itemList.length > this.var_2411)
         {
            _loc2_ = this._itemList.shift();
            _loc3_ = this.var_278.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               this.var_278.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               this.var_126.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < this._itemList.length; _loc1_++)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_690)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = this.var_278.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     this.var_278.splice(_loc3_,1);
                  }
                  this.var_126.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(this.var_79.length > 0)
         {
            _loc4_ = true;
         }
         if(this.getTotalContentHeight() > const_120 && !_loc4_ && !this.historyViewerActive())
         {
            if(this.var_30 != null)
            {
               this.stretchAreaBottomTo(this.var_41.y);
               this.alignItems();
               if(!this.historyViewerActive())
               {
                  this.var_30.showHistoryViewer();
               }
               if(!this.historyViewerVisible())
               {
                  this.var_30.visible = true;
               }
            }
         }
         else if(this.historyViewerVisible())
         {
            this.var_30.visible = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + this.var_2412.toString() + "_item_" + (this.var_2410++).toString();
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(this.var_30 != null)
            {
               this.var_30.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_594,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_826,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(this.historyViewerVisible())
         {
            return;
         }
         if(this.var_30 != null)
         {
            this.var_30.beginDrag(param5.stageY);
         }
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(this.var_30 != null)
         {
            this.var_30.beginDrag(param1.stageY,true);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(this.var_30 != null)
         {
            this.var_30.hideHistoryViewer();
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = this.var_41.rectangle.bottom + param1 - 0;
         this.stretchAreaBottomTo(_loc2_);
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = this.var_41.context.getDesktopWindow().height - 0 - const_1492;
         param1 = Math.min(param1,_loc2_);
         this.var_245 = param1 - this.var_41.y;
         this.var_41.height = this.var_245 + RoomChatHistoryPulldown.const_91;
         if(this.var_30 != null)
         {
            this.var_30.containerResized(this.var_41.rectangle);
         }
      }
      
      public function resetArea() : void
      {
         if(this.var_30 == null)
         {
            return;
         }
         this.animationStop();
         this.var_245 = const_1063 + const_471;
         this.var_41.height = this.var_245 + this.var_30.pulldownBarHeight;
         this.var_378.width = this.var_41.width - this.var_30.scrollbarWidth;
         this.var_378.height = this.var_245;
         this.var_126.width = this.var_41.width - this.var_30.scrollbarWidth;
         if(this.historyViewerActive())
         {
            this.var_126.height = this.getTotalContentHeight() + const_471;
         }
         else
         {
            this.var_126.height = this.var_245;
         }
         this.var_378.scrollV = 1;
         if(!this.historyViewerActive())
         {
            this.var_30.containerResized(this.var_41.rectangle);
         }
         this.purgeItems();
         this.alignItems();
      }
      
      private function historyViewerActive() : Boolean
      {
         return this.var_30 == null ? false : Boolean(this.var_30.active);
      }
      
      private function historyViewerVisible() : Boolean
      {
         return this.var_30 == null ? false : Boolean(this.var_30.visible);
      }
      
      public function hideHistoryViewer() : void
      {
         if(this.var_30 != null)
         {
            this.var_30.hideHistoryViewer();
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return this.var_378.height <= 1;
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc4_ = this.var_79[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_690;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = this.var_41.rectangle.bottom;
         this.stretchAreaBottomTo(this.var_41.rectangle.top + _loc1_);
         _loc3_ -= this.var_41.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_1418)
         {
            this.resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc4_ = this.var_79[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         this.var_1786 = true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = this.var_41.rectangle.bottom - 0;
         if(_loc1_ < const_1063)
         {
            if(_loc1_ <= this.var_245 + this.var_41.y)
            {
               if(this.historyViewerActive())
               {
                  this.hideHistoryViewer();
               }
               this.resetArea();
               return;
            }
         }
         if(this.var_1786 && !this.historyViewerActive())
         {
            this.resetArea();
            this.var_1786 = false;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(this.historyViewerActive())
         {
            this.var_126.height = this.getTotalContentHeight() + const_471;
            this.alignItems();
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc1_ = this.var_79[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_79.length)
         {
            _loc1_ = this.var_79[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
   }
}
