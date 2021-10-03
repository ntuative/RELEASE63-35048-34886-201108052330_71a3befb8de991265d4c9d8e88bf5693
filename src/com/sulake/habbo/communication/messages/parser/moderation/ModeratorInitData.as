package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var var_1563:Array;
      
      private var var_1564:Array;
      
      private var _issues:Array;
      
      private var var_1293:Array;
      
      private var var_2654:Boolean;
      
      private var var_2658:Boolean;
      
      private var var_2655:Boolean;
      
      private var var_2656:Boolean;
      
      private var var_2657:Boolean;
      
      private var var_2659:Boolean;
      
      private var var_2653:Boolean;
      
      private var _disposed:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         this._issues = [];
         this.var_1563 = [];
         this.var_1564 = [];
         this.var_1293 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               this._issues.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1563.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1293.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         this.var_2654 = param1.readBoolean();
         this.var_2658 = param1.readBoolean();
         this.var_2655 = param1.readBoolean();
         this.var_2656 = param1.readBoolean();
         this.var_2657 = param1.readBoolean();
         this.var_2659 = param1.readBoolean();
         this.var_2653 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1564.push(param1.readString());
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1563 = null;
         this.var_1564 = null;
         this._issues = null;
         for each(_loc1_ in this.var_1293)
         {
            _loc1_.dispose();
         }
         this.var_1293 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get messageTemplates() : Array
      {
         return this.var_1563;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return this.var_1564;
      }
      
      public function get issues() : Array
      {
         return this._issues;
      }
      
      public function get offenceCategories() : Array
      {
         return this.var_1293;
      }
      
      public function get cfhPermission() : Boolean
      {
         return this.var_2654;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return this.var_2658;
      }
      
      public function get alertPermission() : Boolean
      {
         return this.var_2655;
      }
      
      public function get kickPermission() : Boolean
      {
         return this.var_2656;
      }
      
      public function get banPermission() : Boolean
      {
         return this.var_2657;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return this.var_2659;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return this.var_2653;
      }
   }
}
