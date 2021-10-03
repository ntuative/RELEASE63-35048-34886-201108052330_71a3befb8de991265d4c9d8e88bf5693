package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1074:int = 20;
      
      private static const const_697:int = 9;
      
      private static const const_1475:int = -1;
       
      
      private var var_327:Array;
      
      private var var_840:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_327 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_840)
            {
               this.var_840 = true;
               this.var_327 = new Array();
               this.var_327.push(const_1475);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_840)
            {
               this.var_840 = false;
               this.var_327 = new Array();
               this.var_327.push(const_1074);
               this.var_327.push(const_697 + param1);
               this.var_327.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_327.length > 0)
            {
               super.setAnimation(this.var_327.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
