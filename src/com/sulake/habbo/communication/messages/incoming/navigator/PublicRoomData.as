package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2635:String;
      
      private var var_2373:int;
      
      private var var_2561:int;
      
      private var var_2372:String;
      
      private var var_2636:int;
      
      private var var_2137:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2635 = param1.readString();
         this.var_2373 = param1.readInteger();
         this.var_2561 = param1.readInteger();
         this.var_2372 = param1.readString();
         this.var_2636 = param1.readInteger();
         this.var_2137 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2635;
      }
      
      public function get unitPort() : int
      {
         return this.var_2373;
      }
      
      public function get worldId() : int
      {
         return this.var_2561;
      }
      
      public function get castLibs() : String
      {
         return this.var_2372;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2636;
      }
      
      public function get nodeId() : int
      {
         return this.var_2137;
      }
   }
}
