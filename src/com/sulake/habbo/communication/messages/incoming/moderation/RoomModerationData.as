package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_396:int;
      
      private var var_2835:int;
      
      private var var_3032:Boolean;
      
      private var var_2367:int;
      
      private var _ownerName:String;
      
      private var var_135:RoomData;
      
      private var var_852:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_396 = param1.readInteger();
         this.var_2835 = param1.readInteger();
         this.var_3032 = param1.readBoolean();
         this.var_2367 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_135 = new RoomData(param1);
         this.var_852 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_135 != null)
         {
            this.var_135.dispose();
            this.var_135 = null;
         }
         if(this.var_852 != null)
         {
            this.var_852.dispose();
            this.var_852 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_396;
      }
      
      public function get userCount() : int
      {
         return this.var_2835;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_3032;
      }
      
      public function get ownerId() : int
      {
         return this.var_2367;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_135;
      }
      
      public function get event() : RoomData
      {
         return this.var_852;
      }
   }
}
