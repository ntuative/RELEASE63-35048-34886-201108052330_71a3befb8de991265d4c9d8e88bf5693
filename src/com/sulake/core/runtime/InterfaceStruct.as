package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1532:IID;
      
      private var var_1862:String;
      
      private var var_119:IUnknown;
      
      private var var_824:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1532 = param1;
         this.var_1862 = getQualifiedClassName(this.var_1532);
         this.var_119 = param2;
         this.var_824 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1532;
      }
      
      public function get iis() : String
      {
         return this.var_1862;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_119;
      }
      
      public function get references() : uint
      {
         return this.var_824;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_119 == null;
      }
      
      public function dispose() : void
      {
         this.var_1532 = null;
         this.var_1862 = null;
         this.var_119 = null;
         this.var_824 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_824;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_824) : uint(0);
      }
   }
}
