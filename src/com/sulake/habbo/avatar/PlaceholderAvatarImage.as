package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_935:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1172)
         {
            _structure = null;
            _assets = null;
            var_287 = null;
            var_318 = null;
            _figure = null;
            var_622 = null;
            var_365 = null;
            if(!var_1448 && var_49)
            {
               var_49.dispose();
            }
            var_49 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_827 = null;
            var_1172 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_935[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_935[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_428:
               switch(_loc3_)
               {
                  case AvatarAction.const_935:
                  case AvatarAction.const_544:
                  case AvatarAction.const_456:
                  case AvatarAction.const_760:
                  case AvatarAction.const_435:
                  case AvatarAction.const_1029:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_370:
            case AvatarAction.const_153:
            case AvatarAction.const_254:
            case AvatarAction.const_873:
            case AvatarAction.const_858:
            case AvatarAction.const_781:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
