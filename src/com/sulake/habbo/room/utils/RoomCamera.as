package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1719:Number = 12;
       
      
      private var var_2999:int = -1;
      
      private var var_2992:int = -2;
      
      private var var_232:Vector3d = null;
      
      private var var_1389:Number = 0;
      
      private var var_1685:Number = 0;
      
      private var var_2166:Boolean = false;
      
      private var var_204:Vector3d = null;
      
      private var var_2163:Vector3d;
      
      private var var_2997:Boolean = false;
      
      private var var_2995:Boolean = false;
      
      private var var_2993:Boolean = false;
      
      private var var_2994:Boolean = false;
      
      private var var_2991:int = 0;
      
      private var var_2998:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2996:int = 0;
      
      private var var_3000:int = 0;
      
      private var var_1881:int = -1;
      
      private var var_2165:int = 0;
      
      private var var_2164:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_2163 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_204;
      }
      
      public function get targetId() : int
      {
         return this.var_2999;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2992;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_2163;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2997;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2995;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2993;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2994;
      }
      
      public function get screenWd() : int
      {
         return this.var_2991;
      }
      
      public function get screenHt() : int
      {
         return this.var_2998;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2996;
      }
      
      public function get roomHt() : int
      {
         return this.var_3000;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1881;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_232 != null && this.var_204 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2999 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_2163.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2992 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2997 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2995 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2993 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2994 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2991 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2998 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_2164 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2996 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_3000 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1881 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_232 == null)
         {
            this.var_232 = new Vector3d();
         }
         if(this.var_232.x != param1.x || this.var_232.y != param1.y || this.var_232.z != param1.z)
         {
            this.var_232.assign(param1);
            this.var_2165 = 0;
            _loc2_ = Vector3d.dif(this.var_232,this.var_204);
            this.var_1389 = _loc2_.length;
            this.var_2166 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_232 = null;
         this.var_204 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_204 != null)
         {
            return;
         }
         this.var_204 = new Vector3d();
         this.var_204.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_204 == null)
         {
            this.var_204 = new Vector3d();
         }
         this.var_204.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_232 != null && this.var_204 != null)
         {
            ++this.var_2165;
            if(this.var_2164)
            {
               this.var_2164 = false;
               this.var_204 = this.var_232;
               this.var_232 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_232,this.var_204);
            if(_loc3_.length > this.var_1389)
            {
               this.var_1389 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_204 = this.var_232;
               this.var_232 = null;
               this.var_1685 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1389);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1389 / const_1719;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_2166)
               {
                  if(_loc7_ < this.var_1685)
                  {
                     _loc7_ = this.var_1685;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_2166 = false;
                  }
               }
               this.var_1685 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_204 = Vector3d.sum(this.var_204,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1881 = -1;
      }
   }
}
