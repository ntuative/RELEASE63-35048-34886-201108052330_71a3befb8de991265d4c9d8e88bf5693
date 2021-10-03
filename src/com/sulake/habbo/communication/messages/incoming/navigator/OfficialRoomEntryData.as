package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1212:int = 1;
      
      public static const const_748:int = 2;
      
      public static const const_792:int = 3;
      
      public static const const_1764:int = 4;
       
      
      private var _index:int;
      
      private var var_2834:String;
      
      private var var_2837:String;
      
      private var var_2836:Boolean;
      
      private var var_2838:String;
      
      private var var_1145:String;
      
      private var var_2839:int;
      
      private var var_2835:int;
      
      private var _type:int;
      
      private var var_2537:String;
      
      private var var_1094:GuestRoomData;
      
      private var var_1093:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2834 = param1.readString();
         this.var_2837 = param1.readString();
         this.var_2836 = param1.readInteger() == 1;
         this.var_2838 = param1.readString();
         this.var_1145 = param1.readString();
         this.var_2839 = param1.readInteger();
         this.var_2835 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1212)
         {
            this.var_2537 = param1.readString();
         }
         else if(this._type == const_792)
         {
            this.var_1093 = new PublicRoomData(param1);
         }
         else if(this._type == const_748)
         {
            this.var_1094 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1094 != null)
         {
            this.var_1094.dispose();
            this.var_1094 = null;
         }
         if(this.var_1093 != null)
         {
            this.var_1093.dispose();
            this.var_1093 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2834;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2837;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2836;
      }
      
      public function get picText() : String
      {
         return this.var_2838;
      }
      
      public function get picRef() : String
      {
         return this.var_1145;
      }
      
      public function get folderId() : int
      {
         return this.var_2839;
      }
      
      public function get tag() : String
      {
         return this.var_2537;
      }
      
      public function get userCount() : int
      {
         return this.var_2835;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1094;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1093;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1212)
         {
            return 0;
         }
         if(this.type == const_748)
         {
            return this.var_1094.maxUserCount;
         }
         if(this.type == const_792)
         {
            return this.var_1093.maxUsers;
         }
         return 0;
      }
   }
}
