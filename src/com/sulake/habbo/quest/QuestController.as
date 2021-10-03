package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var var_51:HabboQuestEngine;
      
      private var var_540:QuestsList;
      
      private var var_454:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_382:QuestTracker;
      
      private var var_644:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this.var_51 = param1;
         this.var_382 = new QuestTracker(this.var_51);
         this.var_540 = new QuestsList(this.var_51);
         this.var_454 = new QuestDetails(this.var_51);
         this._questCompleted = new QuestCompleted(this.var_51);
         this.var_644 = new NextQuestTimer(this.var_51);
      }
      
      public function onToolbarClick() : void
      {
         this.var_540.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_540.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_382.onQuest(param1);
         this.var_454.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_644.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_382.onQuestCompleted(param1);
         this.var_454.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_382.onQuestCancelled();
         this.var_454.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_644.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_382.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_540.onRoomExit();
         this.var_382.onRoomExit();
         this.var_454.onRoomExit();
         this.var_644.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_382.update(param1);
         this.var_644.update(param1);
         this.var_540.update(param1);
         this.var_454.update(param1);
      }
      
      public function dispose() : void
      {
         this.var_51 = null;
         if(this.var_540)
         {
            this.var_540.dispose();
            this.var_540 = null;
         }
         if(this.var_382)
         {
            this.var_382.dispose();
            this.var_382 = null;
         }
         if(this.var_454)
         {
            this.var_454.dispose();
            this.var_454 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_644)
         {
            this.var_644.dispose();
            this.var_644 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_51 == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_540;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_454;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_382;
      }
   }
}
