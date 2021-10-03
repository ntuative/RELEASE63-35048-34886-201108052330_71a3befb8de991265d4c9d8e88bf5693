package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2696:int;
      
      private var var_2699:int;
      
      private var var_855:Boolean;
      
      private var var_2697:int;
      
      private var var_2698:int;
      
      private var var_2694:int;
      
      private var var_2695:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2696 = param1.readInteger();
         this.var_2699 = param1.readInteger();
         this.var_855 = param1.readBoolean();
         this.var_2697 = param1.readInteger();
         this.var_2698 = param1.readInteger();
         this.var_2694 = param1.readInteger();
         this.var_2695 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2696;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2699;
      }
      
      public function get online() : Boolean
      {
         return this.var_855;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2697;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2698;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2694;
      }
      
      public function get banCount() : int
      {
         return this.var_2695;
      }
   }
}
