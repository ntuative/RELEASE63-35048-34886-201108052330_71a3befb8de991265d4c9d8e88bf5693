package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const ASSET_LOADER_EVENT_COMPLETE:String = "AssetLoaderEventComplete";
      
      public static const const_1310:String = "AssetLoaderEventProgress";
      
      public static const const_1225:String = "AssetLoaderEventUnload";
      
      public static const const_1340:String = "AssetLoaderEventStatus";
      
      public static const const_40:String = "AssetLoaderEventError";
      
      public static const const_1408:String = "AssetLoaderEventOpen";
       
      
      private var var_434:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_434 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_434;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_434);
      }
      
      override public function toString() : String
      {
         return formatToString("AssetLoaderEvent","type","status");
      }
   }
}
