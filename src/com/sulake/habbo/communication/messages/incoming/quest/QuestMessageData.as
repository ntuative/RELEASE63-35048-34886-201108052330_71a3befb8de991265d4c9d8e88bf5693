package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var include:String;
      
      private var var_2222:int;
      
      private var var_2225:int;
      
      private var var_2228:int;
      
      private var _id:int;
      
      private var var_2223:Boolean;
      
      private var _type:String;
      
      private var var_3069:String;
      
      private var var_3070:int;
      
      private var var_2226:String;
      
      private var var_3068:int;
      
      private var var_3067:int;
      
      private var var_1717:int;
      
      private var var_2224:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_2224 = new Date();
         super();
         this.include = param1.readString();
         this.var_2222 = param1.readInteger();
         this.var_2225 = param1.readInteger();
         this.var_2228 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2223 = param1.readBoolean();
         this._type = param1.readString();
         this.var_3069 = param1.readString();
         this.var_3070 = param1.readInteger();
         this.var_2226 = param1.readString();
         this.var_3068 = param1.readInteger();
         this.var_3067 = param1.readInteger();
         this.var_1717 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.include;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2226;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2222;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2225;
      }
      
      public function get activityPointType() : int
      {
         return this.var_2228;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2223;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_3069;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_3070;
      }
      
      public function get completedSteps() : int
      {
         return this.var_3068;
      }
      
      public function get totalSteps() : int
      {
         return this.var_3067;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1717 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_2224.getTime();
         return int(Math.max(0,this.var_1717 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.include;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2226;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_2223 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_2222 >= this.var_2225;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_2224;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1717 = param1;
      }
   }
}
