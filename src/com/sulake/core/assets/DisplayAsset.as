package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_1166:String;
      
      protected var var_194:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_952:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_952 = param1;
         this.var_1166 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1166;
      }
      
      public function get content() : Object
      {
         return this.var_194;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_952;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_194.loaderInfo != null)
            {
               if(this.var_194.loaderInfo.loader != null)
               {
                  this.var_194.loaderInfo.loader.unload();
               }
            }
            this.var_194 = null;
            this.var_952 = null;
            this._disposed = true;
            this.var_1166 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_194 = param1 as DisplayObject;
            if(this.var_194 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_194 = DisplayAsset(param1).var_194;
            this.var_952 = DisplayAsset(param1).var_952;
            if(this.var_194 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_194 = DisplayAsset(param1).var_194;
            this.var_952 = DisplayAsset(param1).var_952;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
