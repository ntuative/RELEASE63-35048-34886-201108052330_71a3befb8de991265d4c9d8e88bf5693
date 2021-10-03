package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1349:int;
      
      private var var_2487:String;
      
      private var var_1913:int;
      
      private var var_2486:int;
      
      private var var_2485:int;
      
      private var var_1912:int;
      
      private var var_1911:Boolean;
      
      private var _category:String;
      
      private var var_2642:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1349 = param1.readInteger();
         this.var_2487 = param1.readString();
         this.var_1913 = Math.max(1,param1.readInteger());
         this.var_2486 = param1.readInteger();
         this.var_2485 = param1.readInteger();
         this.var_1912 = param1.readInteger();
         this.var_1911 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2642 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_2487;
      }
      
      public function get level() : int
      {
         return this.var_1349;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1913;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2486;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2485;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1912;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1911;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2642;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1349 > 1 || this.var_1911;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1912 = this.var_1913;
      }
   }
}
