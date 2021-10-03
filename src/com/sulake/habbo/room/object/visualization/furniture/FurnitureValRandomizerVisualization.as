package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1074:int = 20;
      
      private static const const_697:int = 10;
      
      private static const const_1523:int = 31;
      
      private static const const_1475:int = 32;
      
      private static const const_698:int = 30;
       
      
      private var var_327:Array;
      
      private var var_840:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_327 = new Array();
         super();
         super.setAnimation(const_698);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_840)
            {
               this.var_840 = true;
               this.var_327 = new Array();
               this.var_327.push(const_1523);
               this.var_327.push(const_1475);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_697)
         {
            if(this.var_840)
            {
               this.var_840 = false;
               this.var_327 = new Array();
               if(direction == 2)
               {
                  this.var_327.push(const_1074 + 5 - param1);
                  this.var_327.push(const_697 + 5 - param1);
               }
               else
               {
                  this.var_327.push(const_1074 + param1);
                  this.var_327.push(const_697 + param1);
               }
               this.var_327.push(const_698);
               return;
            }
            super.setAnimation(const_698);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
