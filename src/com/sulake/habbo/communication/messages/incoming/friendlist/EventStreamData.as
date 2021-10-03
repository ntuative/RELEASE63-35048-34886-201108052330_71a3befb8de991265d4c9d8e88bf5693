package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class EventStreamData
   {
      
      public static const const_828:uint = 0;
      
      public static const const_1383:uint = 1;
      
      public static const const_955:uint = 2;
      
      public static const const_1258:uint = 3;
      
      public static const const_1784:uint = 3;
      
      public static const const_2063:int = 0;
      
      public static const const_1270:int = 1;
      
      public static const const_2001:int = 2;
      
      public static const const_1771:int = 3;
      
      public static const LINK_TARGET_OPEN_MOTTO_CHANGER:int = 4;
      
      public static const const_1848:int = 5;
       
      
      private var _id:int;
      
      private var var_2903:int;
      
      private var var_2905:String;
      
      private var var_2908:String;
      
      private var var_2910:String;
      
      private var var_2071:String;
      
      private var var_2909:int;
      
      private var var_2904:int;
      
      private var var_2906:int;
      
      private var var_2911:Boolean;
      
      private var var_2907:Object;
      
      public function EventStreamData(param1:int, param2:int, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:int, param10:Boolean, param11:IMessageDataWrapper)
      {
         super();
         this._id = param1;
         this.var_2903 = param2;
         this.var_2905 = param3;
         this.var_2908 = param4;
         this.var_2910 = param5;
         this.var_2071 = param6;
         this.var_2909 = param7;
         this.var_2904 = param8;
         this.var_2906 = param9;
         this.var_2911 = param10;
         this.var_2907 = parse(param2,param11);
      }
      
      protected static function parse(param1:int, param2:IMessageDataWrapper) : Object
      {
         var _loc3_:Object = new Object();
         switch(param1)
         {
            case const_828:
               _loc3_.friendId = param2.readString();
               _loc3_.friendName = param2.readString();
               break;
            case const_1383:
               _loc3_.roomId = param2.readString();
               _loc3_.roomName = param2.readString();
               break;
            case const_955:
               _loc3_.achievementCode = param2.readString();
               break;
            case const_1258:
               _loc3_.motto = param2.readString();
         }
         return _loc3_;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get actionId() : int
      {
         return this.var_2903;
      }
      
      public function get accountId() : String
      {
         return this.var_2905;
      }
      
      public function get accountName() : String
      {
         return this.var_2908;
      }
      
      public function get imageFilePath() : String
      {
         return this.var_2071;
      }
      
      public function get minutesSinceEvent() : int
      {
         return this.var_2909;
      }
      
      public function get linkTargetType() : int
      {
         return this.var_2904;
      }
      
      public function get numberOfLikes() : int
      {
         return this.var_2906;
      }
      
      public function get isLikable() : Boolean
      {
         return this.var_2911;
      }
      
      public function get extraDataStruct() : Object
      {
         return this.var_2907;
      }
      
      public function get accountGender() : String
      {
         return this.var_2910;
      }
   }
}

class Struct
{
    
   
   function Struct()
   {
      super();
   }
}

class FriendMadeStruct extends Struct
{
    
   
   public var friendId:String;
   
   public var friendName:String;
   
   function FriendMadeStruct(param1:String, param2:String)
   {
      super();
      this.friendId = param1;
      this.friendName = param2;
   }
}

class RoomLikedStruct extends Struct
{
    
   
   public var roomId:String;
   
   public var roomName:String;
   
   function RoomLikedStruct(param1:String, param2:String)
   {
      super();
      this.roomId = param1;
      this.roomName = param2;
   }
}

class AchievementEarnedStruct extends Struct
{
    
   
   public var achievementCode:String;
   
   function AchievementEarnedStruct(param1:String)
   {
      super();
      this.achievementCode = param1;
   }
}
