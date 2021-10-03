package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1904:int;
      
      private var _name:String;
      
      private var var_1349:int;
      
      private var var_3010:int;
      
      private var var_2361:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_3009:int;
      
      private var var_3012:int;
      
      private var var_3011:int;
      
      private var var_2364:int;
      
      private var var_2367:int;
      
      private var _ownerName:String;
      
      private var var_574:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1904;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1349;
      }
      
      public function get maxLevel() : int
      {
         return this.var_3010;
      }
      
      public function get experience() : int
      {
         return this.var_2361;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_3009;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_3012;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_3011;
      }
      
      public function get respect() : int
      {
         return this.var_2364;
      }
      
      public function get ownerId() : int
      {
         return this.var_2367;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_574;
      }
      
      public function flush() : Boolean
      {
         this.var_1904 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1904 = param1.readInteger();
         this._name = param1.readString();
         this.var_1349 = param1.readInteger();
         this.var_3010 = param1.readInteger();
         this.var_2361 = param1.readInteger();
         this.var_3009 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_3012 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_3011 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2364 = param1.readInteger();
         this.var_2367 = param1.readInteger();
         this.var_574 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
