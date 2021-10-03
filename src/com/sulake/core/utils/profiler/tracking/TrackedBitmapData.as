package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2273:int = 16777215;
      
      public static const const_1201:int = 8191;
      
      public static const const_1183:int = 8191;
      
      public static const const_2157:int = 1;
      
      public static const const_1401:int = 1;
      
      public static const const_1423:int = 1;
      
      private static var var_532:uint = 0;
      
      private static var var_533:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1201)
         {
            param2 = const_1201;
         }
         else if(param2 < const_1401)
         {
            param2 = const_1401;
         }
         if(param3 > const_1183)
         {
            param3 = const_1183;
         }
         else if(param3 < const_1423)
         {
            param3 = const_1423;
         }
         super(param2,param3,param4,param5);
         ++var_532;
         var_533 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_532;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_533;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_533 -= width * height * 4;
            --var_532;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
