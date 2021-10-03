package com.sulake.habbo.inventory.furni
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestRoomPropertySet;
   import com.sulake.habbo.communication.messages.outgoing.notifications.ResetUnseenItemsComposer;
   import com.sulake.habbo.communication.messages.outgoing.notifications.UnseenItemCategoryEnum;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.FurniModelCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryItemAddedEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.pets.PetsModel;
   import com.sulake.habbo.inventory.recycler.RecyclerModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class FurniModel extends FurniModelCategory implements IInventoryModel
   {
      
      private static const const_1589:int = 100;
      
      private static const const_1588:int = 1000;
       
      
      private var var_26:HabboInventory;
      
      private var _view:FurniView;
      
      private var var_674:Map;
      
      private var _assets:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _soundManager:IHabboSoundManager;
      
      private var _disposed:Boolean = false;
      
      private var var_1572:int = -1;
      
      private var var_220:Timer;
      
      private var var_2676:XML;
      
      private var var_848:IWindowContainer;
      
      private var var_1392:Boolean;
      
      private var var_675:Timer;
      
      private var var_2677:Boolean;
      
      private var _catalog:IHabboCatalog;
      
      private var var_1571:Vector.<Array>;
      
      private var _wallMsgFragments:Vector.<Array>;
      
      private var var_2678:int;
      
      private var var_469:Array;
      
      private var var_468:Array;
      
      private var _petsModel:PetsModel;
      
      public function FurniModel(param1:HabboInventory, param2:MarketplaceModel, param3:IHabboWindowManager, param4:IHabboCommunicationManager, param5:IAssetLibrary, param6:IRoomEngine, param7:IHabboCatalog, param8:IHabboSoundManager)
      {
         super();
         this.var_26 = param1;
         this._communication = param4;
         this._windowManager = param3;
         this._assets = param5;
         this._roomEngine = param6;
         this._roomEngine.events.addEventListener(RoomEngineObjectEvent.const_171,this.onObjectPlaced);
         this._catalog = param7;
         this._soundManager = param8;
         this.var_469 = [];
         this.var_468 = [];
         this.var_675 = new Timer(const_1589,1);
         this.var_675.addEventListener(TimerEvent.TIMER_COMPLETE,this.onImageUpdateTimerEvent);
         var _loc9_:IAsset = this._assets.getAssetByName("inventory_thumb_xml");
         var _loc10_:XmlAsset = XmlAsset(_loc9_);
         this.var_2676 = XML(_loc10_.content);
         this.clearFurniList();
         this._view = new FurniView(this,param2,this._windowManager,this._assets,this._roomEngine,this._soundManager);
         this._view.switchCategory(const_36);
      }
      
      public function set petsModel(param1:PetsModel) : void
      {
         this._petsModel = param1;
      }
      
      public function get petsModel() : PetsModel
      {
         return this._petsModel;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_26 = null;
            if(this.var_674 != null)
            {
               this.var_674.dispose();
               this.var_674 = null;
            }
            if(this._view != null)
            {
               this._view.dispose();
               this._view = null;
            }
            if(this._roomEngine != null)
            {
               if(this._roomEngine.events != null)
               {
                  this._roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_171,this.onObjectPlaced);
               }
               this._roomEngine = null;
            }
            this._communication = null;
            this._assets = null;
            this._windowManager = null;
            this._catalog = null;
            this._soundManager = null;
            this._petsModel = null;
            if(this.var_675 != null)
            {
               this.var_675.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onImageUpdateTimerEvent);
               this.var_675.stop();
               this.var_675 = null;
            }
            if(this.var_220 != null)
            {
               this.var_220.removeEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
               this.var_220.stop();
               this.var_220 = null;
            }
            if(this.var_848 != null)
            {
               this.var_848.dispose();
               this.var_848 = null;
            }
            this._disposed = true;
         }
      }
      
      public function insertFurniList(param1:String, param2:Array, param3:int, param4:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         if(param3 >= param4 && param3 > 1)
         {
            if(param1 == const_36)
            {
               if(this.var_1571 == null)
               {
                  this.var_1571 = new Vector.<Array>(param3,true);
               }
               _loc15_ = this.var_1571;
            }
            else
            {
               if(this._wallMsgFragments == null)
               {
                  this._wallMsgFragments = new Vector.<Array>(param3,true);
               }
               _loc15_ = this._wallMsgFragments;
            }
            _loc15_[param4 - 1] = param2;
            for each(_loc16_ in _loc15_)
            {
               if(_loc16_ == null)
               {
                  return;
               }
            }
            param2 = new Array();
            for each(_loc17_ in _loc15_)
            {
               param2 = param2.concat(_loc17_);
            }
            _loc15_ = null;
         }
         if(param1 == const_36)
         {
            this.var_1571 = null;
         }
         else
         {
            this._wallMsgFragments = null;
         }
         this.var_26.setInventoryCategoryInit(InventoryCategory.const_78);
         var _loc7_:Array = new Array();
         var _loc8_:Array = new Array();
         var _loc9_:Array = new Array();
         var _loc10_:Array = new Array();
         this.getAllStripIds(param1,_loc7_);
         var _loc11_:int = 0;
         while(_loc11_ < param2.length)
         {
            _loc18_ = FurniData(param2[_loc11_]).stripId;
            if(_loc7_.indexOf(_loc18_) == -1)
            {
               _loc9_.push(_loc18_);
            }
            _loc8_.push(_loc18_);
            _loc11_++;
         }
         _loc11_ = 0;
         while(_loc11_ < _loc7_.length)
         {
            if(_loc8_.indexOf(_loc7_[_loc11_]) == -1)
            {
               _loc10_.push(_loc7_[_loc11_]);
            }
            _loc11_++;
         }
         this._view.setGridLock(param1,true);
         var _loc12_:* = _loc7_.length == 0;
         var _loc13_:int = 0;
         while(_loc13_ < param2.length)
         {
            _loc6_ = FurniData(param2[_loc13_]);
            if(_loc9_.indexOf(_loc6_.stripId) > -1)
            {
               if(_loc6_.itemType == const_36)
               {
                  _loc5_ = new FloorItem(_loc6_.stripId,_loc6_.classId,_loc6_.objId,_loc6_.category,_loc6_.isGroupable,_loc6_.isTradeable,_loc6_.isRecyclable,_loc6_.isSellable,_loc6_.stuffData,_loc6_.extra,_loc6_.expiryTime,0,0,0,_loc6_.slotId,_loc6_.songId);
               }
               else
               {
                  if(_loc6_.itemType != const_43)
                  {
                     throw new Error("Unknown inventory item category: \"" + _loc6_.itemType + "\"");
                  }
                  _loc5_ = new WallItem(_loc6_.stripId,_loc6_.classId,_loc6_.objId,_loc6_.category,_loc6_.isGroupable,_loc6_.isTradeable,_loc6_.isRecyclable,_loc6_.isSellable,_loc6_.stuffData,_loc6_.extra);
               }
               if(_loc12_)
               {
                  this.addFurniAsLast(_loc5_,true);
               }
               else
               {
                  this.addFurniAt(_loc5_,true,0,true);
               }
            }
            _loc13_++;
         }
         var _loc14_:int = 0;
         while(_loc14_ < _loc10_.length)
         {
            this.removeFurni(_loc10_[_loc14_]);
            _loc14_++;
         }
         this._view.setGridLock(param1,false);
         this.updateItemLocks();
         if(this.getSelectedItemIndex(const_36) == -1)
         {
            this.toggleItemSelection(const_36,0);
         }
         if(this.getSelectedItemIndex(const_43) == -1)
         {
            this.toggleItemSelection(const_43,0);
         }
         this.initListImages();
         this.setListInitialized();
         for each(_loc6_ in param2)
         {
            if(_loc9_.indexOf(_loc6_.stripId) > -1)
            {
               _loc19_ = new HabboInventoryItemAddedEvent(_loc6_.classId,_loc6_.stripId,_loc6_.category);
               this.var_26.events.dispatchEvent(_loc19_);
            }
         }
      }
      
      public function isListInited() : Boolean
      {
         return this.var_2677;
      }
      
      public function setListInitialized() : void
      {
         this.var_2677 = true;
         this._view.setViewToState();
      }
      
      public function createNewGroupItemTemplate(param1:int, param2:String, param3:int, param4:String = null, param5:Number = NaN, param6:Boolean = false) : GroupItem
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(param3 == FurniCategory.const_363)
         {
            _loc8_ = this._assets.getAssetByName("icon_wallpaper_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_360)
         {
            _loc8_ = this._assets.getAssetByName("icon_floor_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         else if(param3 == FurniCategory.const_373)
         {
            _loc8_ = this._assets.getAssetByName("icon_landscape_png");
            if(_loc8_ != null)
            {
               _loc7_ = _loc8_.content as BitmapData;
            }
         }
         var _loc10_:IAsset = this._assets.getAssetByName("thumb_icon_recycle_png");
         if(_loc10_ != null)
         {
            _loc9_ = _loc10_.content as BitmapData;
         }
         if(this.var_848 == null)
         {
            this.var_848 = this._windowManager.buildFromXML(this.var_2676) as IWindowContainer;
            _loc12_ = this._assets.getAssetByName("thumb_selected_outline_png") as BitmapDataAsset;
            _loc13_ = this.var_848.findChildByName("outline") as IBitmapWrapperWindow;
            _loc13_.bitmap = _loc12_.content as BitmapData;
            _loc13_.disposesBitmap = false;
         }
         var _loc11_:IWindowContainer = this.var_848.clone() as IWindowContainer;
         return new GroupItem(param1,param2,param3,_loc11_,this._roomEngine,_loc9_.clone(),this.var_26.recyclerModel.running,param4,param5,_loc7_,param6);
      }
      
      public function initListImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = [const_36,const_43];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc1_ = this.getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc6_] as GroupItem;
                  if(!_loc3_.isImageInited)
                  {
                     _loc3_.initImage(false);
                     if(!_loc3_.isImageFinished)
                     {
                        this.var_675.reset();
                        this.var_675.start();
                        return;
                     }
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
      }
      
      private function onImageUpdateTimerEvent(param1:TimerEvent) : void
      {
         this.initListImages();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
         if(param1 > 0)
         {
            if(this.var_220 != null)
            {
               this.var_220.removeEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
               this.var_220.stop();
               this.var_220 = null;
            }
            this.var_220 = new Timer(param1,1);
            this.var_220.addEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
            this.var_220.start();
         }
         else
         {
            this.requestNewList();
         }
      }
      
      public function categorySwitch(param1:String) : void
      {
         if(param1 == InventoryCategory.const_78 && this.var_26.isVisible)
         {
            switch(this._view.visibleCategoryId)
            {
               case const_36:
                  this.var_26.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_43:
                  this.var_26.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_287:
                  this.var_26.toggleInventoryPage(InventoryCategory.const_139);
            }
         }
      }
      
      public function furniCategorySwitch() : void
      {
         if(this.var_26.isVisible)
         {
            switch(this._view.visibleCategoryId)
            {
               case const_36:
                  this.var_26.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_FURNI));
                  break;
               case const_43:
                  this.var_26.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_POSTERS));
                  break;
               case const_287:
                  this.var_26.toggleInventoryPage(InventoryCategory.const_139);
            }
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         this._view.switchCategory(param1);
      }
      
      public function automaticSwitchToPetCategory() : void
      {
         this.var_2678 = getTimer();
         this.switchCategory(const_287);
      }
      
      private function initTimeout(param1:TimerEvent) : void
      {
         if(this.var_220 != null)
         {
            this.var_220.removeEventListener(TimerEvent.TIMER_COMPLETE,this.initTimeout);
            this.var_220.stop();
            this.var_220 = null;
         }
         this.requestNewList();
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         this.var_26.checkCategoryInitilization(InventoryCategory.const_397);
         return this._view.getWindowContainer();
      }
      
      public function closingInventoryView() : void
      {
         if(this._view.isVisible)
         {
            this.resetUnseenItems();
         }
      }
      
      public function updateItemLocks() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:TradingModel = this.var_26.tradingModel;
         if(_loc2_ != null)
         {
            _loc1_ = _loc1_.concat(_loc2_.getOwnItemIdsInTrade());
         }
         var _loc3_:RecyclerModel = this.var_26.recyclerModel;
         if(_loc3_ != null)
         {
            _loc1_ = _loc1_.concat(_loc3_.getOwnItemsInRecycler());
         }
         if(_loc1_.length == 0)
         {
            this.removeAllLocks();
            return;
         }
         var _loc7_:Array = [const_36,const_43];
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_.length)
         {
            _loc5_ = _loc7_[_loc8_];
            _loc4_ = this.getCategoryContent(_loc5_);
            if(_loc4_ != null)
            {
               _loc9_ = 0;
               while(_loc9_ < _loc4_.length)
               {
                  _loc6_ = _loc4_[_loc9_] as GroupItem;
                  _loc6_.addLocksFromData(_loc1_);
                  _loc9_++;
               }
            }
            _loc8_++;
         }
         this._view.updateActionView();
      }
      
      public function addLockTo(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_36,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  _loc4_.addLockTo(param1);
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         this._view.updateActionView();
      }
      
      public function removeLockFrom(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_36,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  if(_loc4_)
                  {
                     _loc4_.removeLockFrom(param1);
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         this._view.updateActionView();
      }
      
      public function showRecyclable(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_36,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  _loc4_.showRecyclable = param1;
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         this._view.updateActionView();
      }
      
      public function clearFurniList() : void
      {
         this.var_674 = new Map();
         this.var_674.add(const_36,new Array());
         this.var_674.add(const_43,new Array());
         if(this._view != null)
         {
            this._view.clearViews();
         }
      }
      
      public function addFurniAsLast(param1:IItem, param2:Boolean = false) : void
      {
         this.addFurniAt(param1,param2);
      }
      
      public function addFurniAt(param1:IItem, param2:Boolean = false, param3:int = -1, param4:Boolean = false) : void
      {
         var _loc5_:* = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         if(param1 is FloorItem)
         {
            _loc6_ = const_36;
            _loc5_ = this.var_469.indexOf(param1.ref) > -1;
         }
         else
         {
            if(!(param1 is WallItem))
            {
               return;
            }
            _loc6_ = const_43;
            _loc5_ = this.var_468.indexOf(param1.ref) > -1;
         }
         var _loc8_:Array = this.getCategoryContent(_loc6_);
         if(!param1.groupable)
         {
            for each(_loc9_ in _loc8_)
            {
               if(_loc9_.type == param1.type)
               {
                  if(_loc9_.getItem(param1.id) != null)
                  {
                     return;
                  }
                  break;
               }
            }
            _loc7_ = this.createNewGroupItemTemplate(param1.type,_loc6_,param1.category,param1.stuffData,param1.extra,param2);
            _loc7_.push(param1,_loc5_);
            if(this._view != null)
            {
               if(_loc5_)
               {
                  _loc8_.unshift(_loc7_);
                  this._view.addItemAt(_loc6_,_loc7_,0);
               }
               else if(param3 == -1)
               {
                  _loc8_.push(_loc7_);
                  this._view.addItemToBottom(_loc6_,_loc7_);
               }
               else
               {
                  _loc8_.splice(param3,0,_loc7_);
                  this._view.addItemAt(_loc6_,_loc7_,param3);
               }
            }
         }
         else
         {
            _loc10_ = 0;
            for(; _loc10_ < _loc8_.length; _loc10_++)
            {
               _loc9_ = _loc8_[_loc10_] as GroupItem;
               if(_loc9_.type == param1.type)
               {
                  if(param1.category != FurniCategory.const_225)
                  {
                     _loc7_ = _loc9_;
                  }
                  if(_loc9_.stuffData == param1.stuffData)
                  {
                     _loc7_ = _loc9_;
                     break;
                  }
                  continue;
                  break;
               }
            }
            if(_loc7_)
            {
               _loc7_.push(param1,_loc5_);
               if(_loc5_)
               {
                  this.moveGroupItemTo(_loc8_,_loc7_,0);
               }
            }
            else
            {
               _loc7_ = this.createNewGroupItemTemplate(param1.type,_loc6_,param1.category,param1.stuffData,param1.extra,param2);
               _loc7_.push(param1,_loc5_);
               if(this._view != null)
               {
                  if(_loc5_)
                  {
                     _loc8_.unshift(_loc7_);
                     this._view.addItemAt(_loc6_,_loc7_,0);
                  }
                  else if(param3 == -1)
                  {
                     _loc8_.push(_loc7_);
                     this._view.addItemToBottom(_loc6_,_loc7_);
                  }
                  else
                  {
                     _loc8_.unshift(_loc7_);
                     this._view.addItemAt(_loc6_,_loc7_,param3);
                  }
               }
            }
         }
         this._view.setViewToState();
         if(param4)
         {
            if(this._view.visibleCategoryId == const_287)
            {
               if(!this.furniIsMostLikelyPetFood())
               {
                  this.var_26.petsModel.switchToFurnitureCategory(_loc6_,true);
               }
            }
            else
            {
               this.switchCategory(_loc6_);
            }
         }
         if(_loc7_.isSelected)
         {
            this._view.updateActionView();
         }
      }
      
      private function furniIsMostLikelyPetFood() : Boolean
      {
         return getTimer() < this.var_2678 + const_1588;
      }
      
      public function removeFurni(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc5_:Array = [const_36,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  _loc8_ = _loc4_.remove(param1);
                  if(_loc8_)
                  {
                     if(this.var_1572 == _loc8_.ref)
                     {
                        this.cancelFurniInMover();
                        if(!this.requestSelectedFurniPlacement())
                        {
                           this.var_26.showView();
                        }
                     }
                     if(_loc4_.getTotalCount() <= 0)
                     {
                        this._view.removeItem(_loc3_,_loc7_);
                        _loc2_.splice(_loc7_,1);
                        if(_loc4_.isSelected)
                        {
                           this.toggleItemSelection(_loc3_,0);
                        }
                     }
                     else
                     {
                        this._view.updateActionView();
                     }
                     this.resetUnseenItems(_loc3_);
                     this._view.setViewToState();
                     return;
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
      }
      
      public function updatePostItCount(param1:int, param2:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:Array = this.getCategoryContent(const_43);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_] as GroupItem;
            _loc6_ = _loc5_.getItem(param1) as WallItem;
            if(_loc6_ != null)
            {
               _loc6_.stuffData = String(param2);
               _loc5_.replaceItem(param1,_loc6_);
            }
            _loc4_++;
         }
      }
      
      public function toggleItemSelection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:Array = this.getCategoryContent(param1);
         if(_loc3_ == null || _loc3_.length == 0)
         {
            return;
         }
         if(param2 > -1 && _loc3_.length > param2)
         {
            _loc4_ = _loc3_[param2] as GroupItem;
            _loc4_.isSelected = true;
            this._view.updateItem(param1,_loc4_,param2);
         }
         if(_loc4_ && _loc4_.isSelected)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if(_loc5_ != param2)
               {
                  _loc4_ = _loc3_[_loc5_] as GroupItem;
                  if(_loc4_ && _loc4_.isSelected)
                  {
                     _loc4_.isSelected = false;
                  }
               }
               _loc5_++;
            }
         }
         this._view.updateActionView();
      }
      
      public function displayItemInfo(param1:GroupItem) : void
      {
         if(this._view && !this._view.disposed)
         {
            this._view.displayItemInfo(param1);
         }
      }
      
      public function getSelectedItemIndex(param1:String = null) : int
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            if(this._view == null)
            {
               return -1;
            }
         }
         if(param1 == null)
         {
            param1 = this._view.visibleCategoryId;
         }
         var _loc2_:Array = this.getCategoryContent(param1);
         if(_loc2_ == null)
         {
            return -1;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc4_] as GroupItem;
            if(_loc3_.isSelected)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      public function getGroupItemInIndex(param1:int, param2:String = null) : GroupItem
      {
         if(param2 == null)
         {
            param2 = this._view.visibleCategoryId;
         }
         var _loc3_:Array = this.getCategoryContent(param2);
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param1] as GroupItem;
      }
      
      public function getGroupItemByType(param1:int) : GroupItem
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:Array = [const_36,const_43];
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc6_];
            _loc2_ = this.getCategoryContent(_loc3_);
            if(_loc2_ != null)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.length)
               {
                  _loc4_ = _loc2_[_loc7_] as GroupItem;
                  if(_loc4_.type == param1)
                  {
                     return _loc4_;
                  }
                  _loc7_++;
               }
            }
            _loc6_++;
         }
         return null;
      }
      
      public function get isTradingOpen() : Boolean
      {
         return this.var_26.getSubCategoryViewId() == InventorySubCategory.const_374;
      }
      
      public function canUserOfferToTrade() : Boolean
      {
         return this.var_26.canUserOfferToTrade();
      }
      
      public function removeAllLocks() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:Array = [const_36,const_43];
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc2_ = _loc4_[_loc5_];
            _loc1_ = this.getCategoryContent(_loc2_);
            if(_loc1_ != null)
            {
               _loc6_ = 0;
               while(_loc6_ < _loc1_.length)
               {
                  _loc3_ = _loc1_[_loc6_] as GroupItem;
                  if(_loc3_ != null)
                  {
                     _loc3_.removeAllLocks();
                  }
                  _loc6_++;
               }
            }
            _loc5_++;
         }
         if(this._view != null)
         {
            this._view.updateActionView();
         }
      }
      
      public function cancelFurniInMover() : void
      {
         if(this.var_1572 > -1)
         {
            this._roomEngine.cancelRoomObjectInsert();
            this.var_1392 = false;
            this.var_1572 = -1;
         }
      }
      
      public function requestSelectedFurniPlacement(param1:Boolean = false) : Boolean
      {
         var _loc2_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.getUnlockedCount() == 0)
         {
            return false;
         }
         var _loc3_:IItem = _loc2_.peek();
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc3_.category == FurniCategory.const_360 || _loc3_.category == FurniCategory.const_363 || _loc3_.category == FurniCategory.const_373)
         {
            if(param1)
            {
               return false;
            }
            this._communication.getHabboMainConnection(null).send(new RequestRoomPropertySet(_loc3_.id));
         }
         else
         {
            this.requestSelectedFurniToMover(_loc3_);
         }
         this._view.updateActionView();
         return true;
      }
      
      private function requestSelectedFurniToMover(param1:IItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         if(param1 is FloorItem)
         {
            _loc2_ = 0;
         }
         else
         {
            _loc2_ = 0;
         }
         if(param1.category == FurniCategory.const_225)
         {
            _loc3_ = this._roomEngine.initializeRoomObjectInsert(param1.id,_loc2_,param1.type,param1.stuffData);
         }
         else
         {
            _loc3_ = this._roomEngine.initializeRoomObjectInsert(param1.id,_loc2_,param1.type,param1.extra.toString());
         }
         if(_loc3_)
         {
            this.var_1572 = param1.ref;
            if(!this.var_26.recyclerModel.running)
            {
               this.requestClose();
            }
            this.var_1392 = true;
         }
         this._view.updateActionView();
      }
      
      public function requestSelectedFurniToTrading() : void
      {
         var _loc1_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:TradingModel = this.var_26.tradingModel;
         if(_loc3_ != null)
         {
            _loc3_.requestAddItemToTrading(_loc2_.id,_loc2_.type,_loc2_.category,_loc2_.groupable,_loc2_.stuffData);
         }
         this._view.updateActionView();
      }
      
      public function requestSelectedFurniSelling() : void
      {
         var _loc1_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IItem = _loc1_.getOneForTrade();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:MarketplaceModel = this.var_26.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.startOfferMaking(_loc2_);
      }
      
      public function requestSelectedFurniToRecycler() : IItem
      {
         var _loc1_:GroupItem = this.getGroupItemInIndex(this.getSelectedItemIndex(),this._view.visibleCategoryId);
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:IItem = _loc1_.getOneForRecycle();
         if(_loc2_ == null)
         {
            return null;
         }
         this._view.updateActionView();
         return _loc2_;
      }
      
      public function requestCurrentActionOnSelection() : void
      {
         if(this.isTradingOpen)
         {
            this.requestSelectedFurniToTrading();
         }
         else
         {
            this.requestSelectedFurniPlacement(false);
         }
      }
      
      public function onObjectPlaced(param1:Event) : void
      {
         if(this.var_1392 && param1.type == RoomEngineObjectEvent.const_171)
         {
            this.var_1392 = false;
         }
      }
      
      public function requestClose() : void
      {
         this.var_26.closeView();
      }
      
      public function requestNewList() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new RequestFurniInventoryComposer());
      }
      
      public function requestCatalogOpen() : void
      {
         this._catalog.openCatalog();
      }
      
      public function getCategoryContent(param1:String) : Array
      {
         return this.var_674.getValue(param1);
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         switch(param1)
         {
            case InventorySubCategory.const_374:
               this.cancelFurniInMover();
               if(this._view != null)
               {
                  this._view.updateActionView();
               }
               break;
            case InventorySubCategory.const_51:
               this.removeAllLocks();
               if(this._view != null)
               {
                  this._view.updateActionView();
               }
         }
      }
      
      public function getAllStripIds(param1:String, param2:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:Array = this.var_674.getValue(param1) as Array;
         if(_loc3_ != null)
         {
            for each(_loc4_ in _loc3_)
            {
               _loc5_ = _loc4_.getTotalCount();
               if(_loc4_.category == FurniCategory.const_841)
               {
                  _loc5_ = 1;
               }
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  param2.push(_loc4_.getAt(_loc6_).id);
                  _loc6_++;
               }
            }
         }
      }
      
      public function updateView() : void
      {
         if(this._view != null)
         {
            this.updateGroupItems(const_36);
            this.updateGroupItems(const_43);
            this._view.updateCategoryButtons();
            this._view.updateActionView();
         }
      }
      
      private function updateGroupItems(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(param1 == const_36)
         {
            _loc2_ = this.var_469;
         }
         else
         {
            if(param1 != const_43)
            {
               return;
            }
            _loc2_ = this.var_468;
         }
         var _loc6_:Array = this.getCategoryContent(param1);
         for each(_loc4_ in _loc6_)
         {
            _loc3_ = _loc4_.getFurniIds();
            for each(_loc5_ in _loc3_)
            {
               if(_loc2_.indexOf(_loc5_) != -1)
               {
                  _loc4_.hasUnseenItems = true;
                  this.moveGroupItemTo(_loc6_,_loc4_,0);
                  break;
               }
            }
         }
      }
      
      private function moveGroupItemTo(param1:Array, param2:GroupItem, param3:int) : void
      {
         var _loc4_:int = param1.indexOf(param2);
         param1.splice(_loc4_,1);
         param1.unshift(param2);
         this._view.moveItemTo(param2,param3);
      }
      
      public function get isPrivateRoom() : Boolean
      {
         if(!this.var_26 || !this.var_26.roomSession)
         {
            return false;
         }
         return this.var_26.roomSession.isPrivateRoom;
      }
      
      public function isMainViewActive() : Boolean
      {
         return this.var_26.isMainViewActive;
      }
      
      public function addUnseenFloorItems(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            if(this.var_469.indexOf(_loc2_) == -1)
            {
               this.var_469.push(_loc2_);
            }
         }
      }
      
      public function addUnseenWallItems(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            if(this.var_468.indexOf(_loc2_) == -1)
            {
               this.var_468.push(_loc2_);
            }
         }
      }
      
      public function getUnseenItemCount(param1:int = 0) : int
      {
         switch(param1)
         {
            case UnseenItemCategoryEnum.const_451:
               return this.var_469.length;
            case UnseenItemCategoryEnum.const_449:
               return this.var_468.length;
            default:
               return this.var_469.length + this.var_468.length;
         }
      }
      
      public function resetUnseenItems(param1:String = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!this._view || !this._view.visibleCategoryId)
         {
            return;
         }
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(!param1)
         {
            param1 = this._view.visibleCategoryId;
         }
         switch(param1)
         {
            case const_43:
               if(this.var_468 && this.var_468.length > 0)
               {
                  _loc2_.send(new ResetUnseenItemsComposer(UnseenItemCategoryEnum.const_449));
                  this.var_468 = [];
                  _loc3_ = this.getCategoryContent(param1);
               }
               break;
            case const_36:
               if(this.var_469 && this.var_469.length > 0)
               {
                  _loc2_.send(new ResetUnseenItemsComposer(UnseenItemCategoryEnum.const_451));
                  this.var_469 = [];
                  _loc3_ = this.getCategoryContent(param1);
               }
         }
         if(_loc3_)
         {
            this.var_26.updateUnseenItemCounts();
            for each(_loc4_ in _loc3_)
            {
               _loc4_.hasUnseenItems = false;
            }
         }
      }
   }
}
