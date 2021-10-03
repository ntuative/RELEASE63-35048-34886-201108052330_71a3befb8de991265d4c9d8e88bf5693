package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1904:int;
      
      private var var_1349:int;
      
      private var var_2366:int;
      
      private var var_2361:int;
      
      private var var_2365:int;
      
      private var _energy:int;
      
      private var var_2363:int;
      
      private var _nutrition:int;
      
      private var var_2362:int;
      
      private var var_2367:int;
      
      private var _ownerName:String;
      
      private var var_2364:int;
      
      private var var_574:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1904;
      }
      
      public function get level() : int
      {
         return this.var_1349;
      }
      
      public function get levelMax() : int
      {
         return this.var_2366;
      }
      
      public function get experience() : int
      {
         return this.var_2361;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2365;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2363;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2362;
      }
      
      public function get ownerId() : int
      {
         return this.var_2367;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2364;
      }
      
      public function get age() : int
      {
         return this.var_574;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1904 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1349 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2366 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2361 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2365 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2363 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2362 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2367 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2364 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_574 = param1;
      }
   }
}
