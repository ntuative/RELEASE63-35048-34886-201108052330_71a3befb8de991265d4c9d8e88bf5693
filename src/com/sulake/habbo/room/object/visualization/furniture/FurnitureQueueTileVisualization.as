package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1475:int = 3;
      
      private static const const_1512:int = 2;
      
      private static const const_1511:int = 1;
      
      private static const const_1510:int = 15;
       
      
      private var var_327:Array;
      
      private var var_1210:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_327 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1512)
         {
            this.var_327 = new Array();
            this.var_327.push(const_1511);
            this.var_1210 = const_1510;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1210 > 0)
         {
            --this.var_1210;
         }
         if(this.var_1210 == 0)
         {
            if(this.var_327.length > 0)
            {
               super.setAnimation(this.var_327.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
