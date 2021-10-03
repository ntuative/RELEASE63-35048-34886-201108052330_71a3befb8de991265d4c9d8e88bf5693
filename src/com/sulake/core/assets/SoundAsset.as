package com.sulake.core.assets
{
   import flash.media.Sound;
   import flash.utils.ByteArray;
   
   public class SoundAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_194:Sound = null;
      
      private var var_1760:AssetTypeDeclaration;
      
      private var var_1166:String;
      
      public function SoundAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1760 = param1;
         this.var_1166 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1166;
      }
      
      public function get content() : Object
      {
         return this.var_194 as Object;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1760;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_194 = null;
            this.var_1760 = null;
            this.var_1166 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is Sound)
         {
            if(this.var_194)
            {
               this.var_194.close();
            }
            this.var_194 = param1 as Sound;
            return;
         }
         if(param1 is ByteArray)
         {
         }
         if(param1 is Class)
         {
            if(this.var_194)
            {
               this.var_194.close();
            }
            this.var_194 = new param1() as Sound;
            return;
         }
         if(param1 is SoundAsset)
         {
            if(this.var_194)
            {
               this.var_194.close();
            }
            this.var_194 = SoundAsset(param1).var_194;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is SoundAsset)
         {
            this.var_194 = SoundAsset(param1).var_194;
         }
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
