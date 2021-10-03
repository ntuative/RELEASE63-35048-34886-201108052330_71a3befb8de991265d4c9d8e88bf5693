package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_350:int = -2.147483648E9;
      
      private var var_349:int = 2.147483647E9;
      
      private var var_347:int = -2.147483648E9;
      
      private var var_348:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_350;
      }
      
      public function get maxWidth() : int
      {
         return this.var_349;
      }
      
      public function get minHeight() : int
      {
         return this.var_347;
      }
      
      public function get maxHeight() : int
      {
         return this.var_348;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_350 = param1;
         if(this.var_350 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_350)
         {
            this._target.width = this.var_350;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_349 = param1;
         if(this.var_349 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_349)
         {
            this._target.width = this.var_349;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_347 = param1;
         if(this.var_347 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_347)
         {
            this._target.height = this.var_347;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_348 = param1;
         if(this.var_348 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_348)
         {
            this._target.height = this.var_348;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_350 == int.MIN_VALUE && this.var_349 == int.MAX_VALUE && this.var_347 == int.MIN_VALUE && this.var_348 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_350 = int.MIN_VALUE;
         this.var_349 = int.MAX_VALUE;
         this.var_347 = int.MIN_VALUE;
         this.var_348 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_350)
            {
               this._target.width = this.var_350;
            }
            else if(this._target.width > this.var_349)
            {
               this._target.width = this.var_349;
            }
            if(this._target.height < this.var_347)
            {
               this._target.height = this.var_347;
            }
            else if(this._target.height > this.var_348)
            {
               this._target.height = this.var_348;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_350 = param1;
         this.var_349 = param2;
         this.var_347 = param3;
         this.var_348 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_350 = this.var_350;
         _loc2_.var_349 = this.var_349;
         _loc2_.var_347 = this.var_347;
         _loc2_.var_348 = this.var_348;
         return _loc2_;
      }
   }
}
