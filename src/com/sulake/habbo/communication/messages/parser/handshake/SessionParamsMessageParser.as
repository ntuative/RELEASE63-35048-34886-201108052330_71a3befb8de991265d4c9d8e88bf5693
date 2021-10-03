package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_2290:Boolean;
      
      protected var var_2291:Boolean;
      
      protected var var_2501:String;
      
      protected var var_2292:Boolean;
      
      protected var var_2293:Boolean;
      
      protected var var_2294:Boolean;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_3090:Boolean;
      
      protected var var_3089:String;
      
      protected var var_3091:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_2290 = false;
         this.var_2291 = false;
         this.var_2501 = "";
         this.var_2292 = false;
         this.var_2293 = false;
         this.var_2294 = false;
         this._confPartnerIntegration = false;
         this.var_3090 = false;
         this.var_3089 = "";
         this.var_3091 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  this.var_2290 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  this.var_2291 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  this.var_2292 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  this.var_2293 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  this.var_2294 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get coppa() : Boolean
      {
         return this.var_2290;
      }
      
      public function get voucher() : Boolean
      {
         return this.var_2291;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return this.var_2292;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return this.var_2293;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return this.var_2294;
      }
      
      public function get date() : String
      {
         return this.var_2501;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return this._confPartnerIntegration;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return this.var_3090;
      }
      
      public function get tracking_header() : String
      {
         return this.var_3089;
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return this.var_3091;
      }
   }
}
