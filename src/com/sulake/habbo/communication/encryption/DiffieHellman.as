package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1081:BigInteger;
      
      private var var_2680:BigInteger;
      
      private var var_1940:BigInteger;
      
      private var var_2679:BigInteger;
      
      private var var_1573:BigInteger;
      
      private var var_1941:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1573 = param1;
         this.var_1941 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1573.toString() + ",generator: " + this.var_1941.toString() + ",secret: " + param1);
         this.var_1081 = new BigInteger();
         this.var_1081.fromRadix(param1,param2);
         this.var_2680 = this.var_1941.modPow(this.var_1081,this.var_1573);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1940 = new BigInteger();
         this.var_1940.fromRadix(param1,param2);
         this.var_2679 = this.var_1940.modPow(this.var_1081,this.var_1573);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2680.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2679.toRadix(param1);
      }
   }
}
