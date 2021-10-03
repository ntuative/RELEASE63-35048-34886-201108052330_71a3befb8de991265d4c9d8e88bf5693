package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_1159:String = "avatar";
      
      private static const const_727:Number = -0.01;
      
      private static const const_728:Number = -0.409;
      
      private static const const_1161:int = 2;
      
      private static const const_1637:Array = [0,0,0];
      
      private static const const_1735:int = 3;
       
      
      private var var_750:AvatarVisualizationData = null;
      
      private var var_566:Map;
      
      private var var_608:Map;
      
      private var var_1327:int = 0;
      
      private var var_978:Boolean;
      
      private var _figure:String;
      
      private var var_1006:String;
      
      private var var_1328:int = 0;
      
      private var var_749:BitmapDataAsset;
      
      private var var_1141:BitmapDataAsset;
      
      private var var_2006:int = -1;
      
      private var var_2200:int = -1;
      
      private var var_2201:int = -1;
      
      private const const_1160:int = 0;
      
      private const const_2116:int = 1;
      
      private const const_2129:int = 2;
      
      private const const_2128:int = 3;
      
      private const const_1636:int = 4;
      
      private var var_1881:int = -1;
      
      private var var_309:String = "";
      
      private var var_1696:String = "";
      
      private var var_2196:Boolean = false;
      
      private var var_2199:Boolean = false;
      
      private var var_2197:Boolean = false;
      
      private var var_1697:Boolean = false;
      
      private var var_745:Boolean = false;
      
      private var var_1611:int = 0;
      
      private var _danceStyle:int = 0;
      
      private var var_2195:int = 0;
      
      private var var_931:int = 0;
      
      private var var_932:int = 0;
      
      private var var_748:int = 0;
      
      private var var_1695:int = 0;
      
      private var var_1407:Boolean = false;
      
      private var var_2198:Boolean = false;
      
      private var var_1408:int = 0;
      
      private var var_933:int = 0;
      
      private var var_2194:Boolean = false;
      
      private var var_1409:int = 0;
      
      private var var_67:IAvatarImage = null;
      
      private var var_1172:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_566 = new Map();
         this.var_608 = new Map();
         this.var_978 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_566 != null)
         {
            this.resetImages();
            this.var_566.dispose();
            this.var_608.dispose();
            this.var_566 = null;
         }
         this.var_750 = null;
         this.var_749 = null;
         this.var_1141 = null;
         super.dispose();
         this.var_1172 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1172;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_750 = param1 as AvatarVisualizationData;
         createSprites(this.const_1636);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_145)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_189) > 0 && param3);
            if(_loc5_ != this.var_2196)
            {
               this.var_2196 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_317) > 0;
            if(_loc5_ != this.var_2199)
            {
               this.var_2199 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_256) > 0;
            if(_loc5_ != this.var_2197)
            {
               this.var_2197 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_757) > 0 && param3);
            if(_loc5_ != this.var_1697)
            {
               this.var_1697 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_550) > 0;
            if(_loc5_ != this.var_745)
            {
               this.var_745 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_177);
            if(_loc6_ != this.var_1611)
            {
               this.var_1611 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_304);
            if(_loc7_ != this.var_309)
            {
               this.var_309 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_894);
            if(_loc7_ != this.var_1696)
            {
               this.var_1696 = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_627);
            if(_loc6_ != this._danceStyle)
            {
               this._danceStyle = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_541);
            if(_loc6_ != this.var_931)
            {
               this.var_931 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_342);
            if(_loc6_ != this.var_932)
            {
               this.var_932 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_294);
            if(_loc6_ != this.var_748)
            {
               this.var_748 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_231);
            if(_loc6_ != this.var_2006)
            {
               this.var_2006 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_932 > 0 && param1.getNumber(RoomObjectVariableEnum.const_294) > 0)
            {
               if(this.var_748 != this.var_932)
               {
                  this.var_748 = this.var_932;
                  _loc4_ = true;
               }
            }
            else if(this.var_748 != 0)
            {
               this.var_748 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_453);
            if(_loc6_ != this.var_1408)
            {
               this.var_1408 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.AVATAR_GENDER);
            if(_loc7_ != this.var_1006)
            {
               this.var_1006 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_238);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_430);
            if(_loc6_ != this.var_2195)
            {
               _loc4_ = true;
            }
            var_145 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this._figure != param1)
         {
            this._figure = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_566)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_608)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_566.reset();
         this.var_608.reset();
         this.var_67 = null;
         _loc2_ = getSprite(this.const_1160);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1697 = false;
         }
         if(this.var_309 == "sit" || this.var_309 == "lay")
         {
            this.var_1695 = param1 / 2;
         }
         else
         {
            this.var_1695 = 0;
         }
         this.var_2198 = false;
         this.var_1407 = false;
         if(this.var_309 == "lay")
         {
            this.var_1407 = true;
            _loc2_ = int(this.var_1696);
            if(_loc2_ < 0)
            {
               this.var_2198 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_566.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_608.getValue(_loc4_) as IAvatarImage;
            if(_loc3_)
            {
               _loc3_.forceActionUpdate();
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_750.getAvatar(this._figure,param1,this.var_1006,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_566.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_608.length >= const_1735)
                  {
                     _loc5_ = this.var_608.remove(this.var_608.getKey(0));
                     if(_loc5_)
                     {
                        _loc5_.dispose();
                     }
                  }
                  this.var_608.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_520 != param1.getUpdateID() || this.var_1881 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_2006;
            if(this.var_309 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_2200 || param4)
            {
               _loc5_ = true;
               this.var_2200 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_67.setDirectionAngle(AvatarSetType.const_42,_loc6_);
            }
            if(_loc7_ != this.var_2201 || param4)
            {
               _loc5_ = true;
               this.var_2201 = _loc7_;
               if(this.var_2201 != this.var_2200)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_67.setDirectionAngle(AvatarSetType.const_54,_loc7_);
               }
            }
            var_520 = param1.getUpdateID();
            this.var_1881 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2116);
         this.var_749 = null;
         if(this.var_309 == "mv" || this.var_309 == "std")
         {
            _loc2_.visible = true;
            if(this.var_749 == null || param1 != var_101)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_749 = this.var_67.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_749 = this.var_67.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_749 != null)
               {
                  _loc2_.asset = this.var_749.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_749 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_1141 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2129);
         if(this.var_745)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_1141 = this.var_750.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_1141 = this.var_750.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_309 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_309 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_1141 != null)
            {
               _loc2_.asset = this.var_1141.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_2128);
         if(this.var_1408 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_750.getAvatarRendererAsset("number_" + this.var_1408 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_750.getAvatarRendererAsset("number_" + this.var_1408 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_309 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_309 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_933 = 1;
               this.var_2194 = true;
               this.var_1409 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_933 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2128);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_2194)
         {
            ++this.var_1409;
            if(this.var_1409 < 10)
            {
               return false;
            }
            if(this.var_933 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1409 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_933 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_933 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_933 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_933 = 0;
               this.var_2194 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_750 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_931;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_101 || this.var_67 == null)
         {
            if(_loc7_ != var_101)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_931)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_67 == null || _loc12_)
            {
               this.var_67 = this.getAvatarImage(_loc7_,this.var_931);
               if(this.var_67 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_1160);
               if(_loc16_ && this.var_67 && this.var_67.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_67 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_67);
            var_101 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_978 || this.var_1328 > 0) && param3;
         if(_loc14_)
         {
            this.var_1328 = const_1161;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1328;
            --this.var_1327;
            if(!(this.var_1327 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_67.updateAnimationByFrames(1);
            this.var_1327 = const_1161;
            _loc18_ = this.var_67.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1637;
            }
            _loc17_ = getSprite(this.const_1160);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_67.getImage(AvatarSetType.const_42,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1695;
               }
               if(this.var_1407)
               {
                  if(this.var_2198)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_728 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_727 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_2129);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1407)
               {
                  _loc17_.relativeDepth = const_727 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_728 - 0.01 + _loc18_[2];
               }
            }
            this.var_978 = this.var_67.isAnimating();
            _loc19_ = this.const_1636;
            for each(_loc20_ in this.var_67.getSprites())
            {
               if(_loc20_.id == const_1159)
               {
                  _loc17_ = getSprite(this.const_1160);
                  _loc22_ = this.var_67.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_67.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_67.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_67.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_67.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_67.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_67.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_67.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_67.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_67.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1695;
                     if(this.var_1407)
                     {
                        _loc17_.relativeDepth = const_728 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_727 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_428,this.var_309,this.var_1696);
         if(this.var_1611 > 0)
         {
            param1.appendAction(AvatarAction.const_383,AvatarAction.const_1869[this.var_1611]);
         }
         if(this._danceStyle > 0)
         {
            param1.appendAction(AvatarAction.const_153,this._danceStyle);
         }
         if(this.var_2195 > 0)
         {
            param1.appendAction(AvatarAction.const_873,this.var_2195);
         }
         if(this.var_932 > 0)
         {
            param1.appendAction(AvatarAction.const_858,this.var_932);
         }
         if(this.var_748 > 0)
         {
            param1.appendAction(AvatarAction.const_781,this.var_748);
         }
         if(this.var_2196)
         {
            param1.appendAction(AvatarAction.const_381);
         }
         if(this.var_2197 || this.var_1697)
         {
            param1.appendAction(AvatarAction.const_603);
         }
         if(this.var_2199)
         {
            param1.appendAction(AvatarAction.const_254);
         }
         if(this.var_931 > 0)
         {
            param1.appendAction(AvatarAction.const_370,this.var_931);
         }
         param1.endActionAppends();
         this.var_978 = param1.isAnimating();
         var _loc2_:int = this.const_1636;
         for each(_loc3_ in this.var_67.getSprites())
         {
            if(_loc3_.id != const_1159)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
