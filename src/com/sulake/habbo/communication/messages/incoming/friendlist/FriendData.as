package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1006:int;
      
      private var var_855:Boolean;
      
      private var var_1910:Boolean;
      
      private var _figure:String;
      
      private var var_1508:int;
      
      private var var_2068:String;
      
      private var var_1970:String;
      
      private var var_1969:String;
      
      private var var_2739:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1006 = param1.readInteger();
         this.var_855 = param1.readBoolean();
         this.var_1910 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1508 = param1.readInteger();
         this.var_2068 = param1.readString();
         this.var_1970 = param1.readString();
         this.var_1969 = param1.readString();
         this.var_2739 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1006;
      }
      
      public function get online() : Boolean
      {
         return this.var_855;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1910;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1508;
      }
      
      public function get motto() : String
      {
         return this.var_2068;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1970;
      }
      
      public function get realName() : String
      {
         return this.var_1969;
      }
      
      public function get facebookId() : String
      {
         return this.var_2739;
      }
   }
}
