package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2216:int = 0;
      
      public static const const_1978:int = 1;
      
      public static const const_2016:int = 2;
      
      public static const const_2365:int = 3;
      
      public static const const_2194:int = 4;
      
      public static const const_2231:int = 5;
      
      public static const const_1787:int = 10;
      
      public static const const_2329:int = 11;
      
      public static const const_2335:int = 12;
      
      public static const const_2344:int = 13;
      
      public static const const_2152:int = 16;
      
      public static const const_2199:int = 17;
      
      public static const const_2234:int = 18;
      
      public static const const_2287:int = 19;
      
      public static const const_2348:int = 20;
      
      public static const const_2268:int = 22;
      
      public static const const_2147:int = 23;
      
      public static const const_2191:int = 24;
      
      public static const const_2163:int = 25;
      
      public static const const_2363:int = 26;
      
      public static const const_2249:int = 27;
      
      public static const const_2164:int = 28;
      
      public static const const_2351:int = 29;
      
      public static const const_2187:int = 100;
      
      public static const const_2294:int = 101;
      
      public static const const_2362:int = 102;
      
      public static const const_2155:int = 103;
      
      public static const const_2143:int = 104;
      
      public static const const_2255:int = 105;
      
      public static const const_2189:int = 106;
      
      public static const const_2141:int = 107;
      
      public static const const_2288:int = 108;
      
      public static const const_2202:int = 109;
      
      public static const const_2334:int = 110;
      
      public static const const_2222:int = 111;
      
      public static const const_2305:int = 112;
      
      public static const const_2306:int = 113;
      
      public static const const_2232:int = 114;
      
      public static const const_2358:int = 115;
      
      public static const const_2264:int = 116;
      
      public static const const_2161:int = 117;
      
      public static const const_2237:int = 118;
      
      public static const const_2252:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_9 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1978:
            case const_1787:
               return "banned";
            case const_2016:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
