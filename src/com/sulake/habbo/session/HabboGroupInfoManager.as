package com.sulake.habbo.session
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.HabboGroupBadgesMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsData;
   import com.sulake.habbo.communication.messages.incoming.users.HabboGroupDetailsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.HabboGroupJoinFailedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.HabboGroupsWhereMemberMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.users.GetHabboGroupBadgesMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.IEventDispatcher;
   
   public class HabboGroupInfoManager
   {
       
      
      private var var_210:SessionDataManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _events:IEventDispatcher;
      
      private var var_262:Map;
      
      private var var_1332:GroupDetailsView;
      
      public function HabboGroupInfoManager(param1:SessionDataManager, param2:IEventDispatcher)
      {
         super();
         this.var_210 = param1;
         this.var_262 = new Map();
         this._events = param2;
      }
      
      public function dispose() : void
      {
         this._communication = null;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         this._communication = param1;
         this._communication.addHabboConnectionMessageEvent(new RoomReadyMessageEvent(this.onRoomReady) as IMessageEvent);
         this._communication.addHabboConnectionMessageEvent(new HabboGroupBadgesMessageEvent(this.onHabboGroupBadges));
         this._communication.addHabboConnectionMessageEvent(new HabboGroupDetailsMessageEvent(this.onGroupDetails));
         this._communication.addHabboConnectionMessageEvent(new HabboGroupsWhereMemberMessageEvent(this.onGroupsWhereMember));
         this._communication.addHabboConnectionMessageEvent(new HabboGroupJoinFailedMessageEvent(this.onJoinFailed));
         this._communication.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomExit));
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         this._communication.getHabboMainConnection(null).send(new GetHabboGroupBadgesMessageComposer());
      }
      
      private function onHabboGroupBadges(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc2_:HabboGroupBadgesMessageEvent = param1 as HabboGroupBadgesMessageEvent;
         var _loc3_:Map = _loc2_.badges;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_.length)
         {
            _loc4_ = _loc3_.getKey(_loc6_);
            if(this.var_262.getValue(_loc4_) != null)
            {
               this.var_262.remove(_loc4_);
            }
            this.var_262.add(_loc4_,_loc3_.getWithIndex(_loc6_));
            _loc6_++;
         }
      }
      
      private function onGroupDetails(param1:IMessageEvent) : void
      {
         var _loc2_:HabboGroupDetailsData = HabboGroupDetailsMessageEvent(param1).data;
         this.getGroupDetailsView().onGroupDetails(_loc2_);
      }
      
      private function onGroupsWhereMember(param1:IMessageEvent) : void
      {
         var _loc2_:Array = HabboGroupsWhereMemberMessageEvent(param1).groups;
         this.getGroupDetailsView().onGroups(_loc2_);
      }
      
      private function onJoinFailed(param1:IMessageEvent) : void
      {
         var _loc2_:int = HabboGroupJoinFailedMessageEvent(param1).reason;
         var _loc3_:String = "group.joinfail." + _loc2_;
         var _loc4_:String = this.var_210.localization.getKey(_loc3_,_loc3_);
         this.var_210.windowManager.alert("${group.joinfail.title}",_loc4_,0,this.onAlertClose);
      }
      
      private function onRoomExit(param1:IMessageEvent) : void
      {
         if(this.var_1332 != null)
         {
            this.var_1332.close();
         }
      }
      
      private function getGroupDetailsView() : GroupDetailsView
      {
         if(this.var_1332 == null)
         {
            this.var_1332 = new GroupDetailsView(this.var_210);
         }
         return this.var_1332;
      }
      
      public function getBadgeId(param1:int) : String
      {
         return this.var_262.getValue(param1);
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:WindowEvent) : void
      {
         param1.dispose();
      }
   }
}
