package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_1166:String;
      
      protected var _type:String;
      
      protected var var_148:URLStream;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         this.var_1166 = param2 == null ? "" : param2.url;
         this._type = param1;
         this.var_148 = new URLStream();
         this.var_148.addEventListener(Event.COMPLETE,loadEventHandler);
         this.var_148.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         this.var_148.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         this.var_148.addEventListener(Event.OPEN,loadEventHandler);
         this.var_148.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         this.var_148.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get url() : String
      {
         return this.var_1166;
      }
      
      public function get ready() : Boolean
      {
         return this.bytesTotal > 0 ? this.bytesTotal == this.bytesLoaded : false;
      }
      
      public function get content() : Object
      {
         return this.var_148;
      }
      
      public function get mimeType() : String
      {
         return this._type;
      }
      
      public function get bytesLoaded() : uint
      {
         return this.var_148.bytesAvailable;
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_148.bytesAvailable;
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_1166 = param1.url;
         this.var_148.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            this.var_148.removeEventListener(Event.COMPLETE,loadEventHandler);
            this.var_148.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            this.var_148.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            this.var_148.removeEventListener(Event.OPEN,loadEventHandler);
            this.var_148.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            this.var_148.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            this.var_148.close();
            this.var_148 = null;
            this._type = null;
            this.var_1166 = null;
         }
      }
   }
}
