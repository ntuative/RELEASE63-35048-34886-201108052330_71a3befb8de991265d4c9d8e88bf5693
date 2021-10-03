package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_1106:String;
      
      private var var_2425:String;
      
      private var var_1969:String;
      
      private var var_2424:int;
      
      private var var_2422:int;
      
      private var var_1379:int;
      
      private var var_911:int;
      
      private var var_2423:Boolean;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_1106 = param1.readString();
         this.var_2425 = param1.readString();
         this.var_1969 = param1.readString();
         this.var_2424 = param1.readInteger();
         this.var_2422 = param1.readInteger();
         this.var_1379 = param1.readInteger();
         this.var_911 = param1.readInteger();
         this.var_2423 = param1.readBoolean();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_1106;
      }
      
      public function get customData() : String
      {
         return this.var_2425;
      }
      
      public function get realName() : String
      {
         return this.var_1969;
      }
      
      public function get directMail() : int
      {
         return this.var_2424;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2422;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1379;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_911;
      }
      
      public function get streamPublishingAllowed() : Boolean
      {
         return this.var_2423;
      }
   }
}
