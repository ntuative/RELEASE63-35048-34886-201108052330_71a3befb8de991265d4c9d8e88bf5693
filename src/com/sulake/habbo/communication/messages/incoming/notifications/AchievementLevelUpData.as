package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1349:int;
      
      private var var_1797:int;
      
      private var var_2486:int;
      
      private var var_2485:int;
      
      private var var_2490:int;
      
      private var var_2487:int;
      
      private var var_2488:String = "";
      
      private var var_2489:String = "";
      
      private var var_2491:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1349 = param1.readInteger();
         this.var_2487 = param1.readInteger();
         this.var_2488 = param1.readString();
         this.var_1797 = param1.readInteger();
         this.var_2486 = param1.readInteger();
         this.var_2485 = param1.readInteger();
         this.var_2490 = param1.readInteger();
         this.var_2491 = param1.readInteger();
         this.var_2489 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1349;
      }
      
      public function get points() : int
      {
         return this.var_1797;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2486;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2485;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2490;
      }
      
      public function get badgeId() : int
      {
         return this.var_2487;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2488;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2489;
      }
      
      public function get achievementID() : int
      {
         return this.var_2491;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
