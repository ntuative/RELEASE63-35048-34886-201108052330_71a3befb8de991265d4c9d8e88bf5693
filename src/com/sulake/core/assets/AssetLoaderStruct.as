package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_976:IAssetLoader;
      
      private var var_2397:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2397 = param1;
         this.var_976 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2397;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_976;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_976 != null)
            {
               if(!this.var_976.disposed)
               {
                  this.var_976.dispose();
                  this.var_976 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
