package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2332:int;
      
      private var var_1968:String;
      
      private var var_2715:String;
      
      private var var_2945:Boolean;
      
      private var var_2946:Boolean;
      
      private var var_2944:int;
      
      private var var_2714:String;
      
      private var var_2947:String;
      
      private var var_1969:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2332 = param1.readInteger();
         this.var_1968 = param1.readString();
         this.var_2715 = param1.readString();
         this.var_2945 = param1.readBoolean();
         this.var_2946 = param1.readBoolean();
         param1.readString();
         this.var_2944 = param1.readInteger();
         this.var_2714 = param1.readString();
         this.var_2947 = param1.readString();
         this.var_1969 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2332;
      }
      
      public function get avatarName() : String
      {
         return this.var_1968;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2715;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2945;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2946;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2944;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2714;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2947;
      }
      
      public function get realName() : String
      {
         return this.var_1969;
      }
   }
}
