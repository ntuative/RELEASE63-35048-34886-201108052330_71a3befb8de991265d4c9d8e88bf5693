package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2392:String;
      
      private var var_340:String;
      
      public function WelcomeNotification(param1:String, param2:String)
      {
         super();
         this.var_2392 = param1;
         this.var_340 = param2;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2392;
      }
      
      public function get localizationKey() : String
      {
         return this.var_340;
      }
   }
}
