package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_183:int = 1;
      
      public static const const_402:int = 2;
      
      public static const const_1883:int = 3;
       
      
      private var var_2640:int;
      
      private var _state:int;
      
      private var var_1508:int;
      
      private var _reportedCategoryId:int;
      
      private var var_2134:int;
      
      private var _priority:int;
      
      private var var_2973:int = 0;
      
      private var var_2972:int;
      
      private var var_2974:String;
      
      private var var_1676:int;
      
      private var var_2156:String;
      
      private var var_2958:int;
      
      private var var_2971:String;
      
      private var _message:String;
      
      private var var_2922:int;
      
      private var var_1067:String;
      
      private var var_1480:int;
      
      private var var_2970:String;
      
      private var var_396:int;
      
      private var var_2969:String;
      
      private var var_2671:String;
      
      private var var_2373:int;
      
      private var var_2561:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2640 = param1;
         this._state = param2;
         this.var_1508 = param3;
         this._reportedCategoryId = param4;
         this.var_2134 = param5;
         this._priority = param6;
         this.var_2972 = param7;
         this.var_2974 = param8;
         this.var_1676 = param9;
         this.var_2156 = param10;
         this.var_2958 = param11;
         this.var_2971 = param12;
         this._message = param13;
         this.var_2922 = param14;
         this.var_1067 = param15;
         this.var_1480 = param16;
         this.var_2970 = param17;
         this.var_396 = param18;
         this.var_2969 = param19;
         this.var_2671 = param20;
         this.var_2373 = param21;
         this.var_2561 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2640;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1508;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_2134;
      }
      
      public function get priority() : int
      {
         return this._priority + this.var_2973;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2972;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2974;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1676;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_2156;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2958;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2971;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get method_5() : int
      {
         return this.var_2922;
      }
      
      public function get roomName() : String
      {
         return this.var_1067;
      }
      
      public function get roomType() : int
      {
         return this.var_1480;
      }
      
      public function get flatType() : String
      {
         return this.var_2970;
      }
      
      public function get flatId() : int
      {
         return this.var_396;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2969;
      }
      
      public function get roomResources() : String
      {
         return this.var_2671;
      }
      
      public function get unitPort() : int
      {
         return this.var_2373;
      }
      
      public function get worldId() : int
      {
         return this.var_2561;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2973 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_2134) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
