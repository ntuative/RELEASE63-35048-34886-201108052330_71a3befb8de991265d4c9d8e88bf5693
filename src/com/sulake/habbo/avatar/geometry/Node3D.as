package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_487:Vector3D;
      
      private var var_2077:Vector3D;
      
      private var var_2830:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         this.var_2077 = new Vector3D();
         super();
         this.var_487 = new Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            this.var_2830 = true;
         }
      }
      
      public function get location() : Vector3D
      {
         return this.var_487;
      }
      
      public function get transformedLocation() : Vector3D
      {
         return this.var_2077;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(this.var_2830)
         {
            this.var_2077 = param1.vectorMultiplication(this.var_487);
         }
      }
   }
}
