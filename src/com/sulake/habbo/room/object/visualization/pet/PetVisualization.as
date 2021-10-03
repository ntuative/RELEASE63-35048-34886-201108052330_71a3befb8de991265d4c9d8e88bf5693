package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
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
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_1161:int = 2;
      
      private static const const_1637:Array = [0,0,0];
       
      
      private var var_750:PetVisualizationData = null;
      
      private var var_566:Map;
      
      private var var_1327:int = 0;
      
      private var var_624:int = 0;
      
      private var var_978:Boolean;
      
      private var _figure:String;
      
      private var var_1328:int = 0;
      
      private var _updateTimes:Array;
      
      private var var_749:BitmapDataAsset;
      
      private var var_426:ExperienceData;
      
      private var var_1172:Boolean = false;
      
      private var var_2005:Boolean = false;
      
      private const const_2394:int = 3;
      
      private var var_1881:int = -1;
      
      private const const_1160:int = 0;
      
      private const const_2116:int = 1;
      
      private const const_2129:int = 2;
      
      private const const_1636:int = 3;
      
      private var var_67:IAvatarImage = null;
      
      private var var_309:String = "";
      
      private var var_1696:String = "";
      
      private var var_2197:Boolean = false;
      
      private var var_1697:Boolean = false;
      
      private var var_2198:Boolean = false;
      
      private var var_1407:Boolean = false;
      
      private var var_2004:Boolean = false;
      
      private var var_1611:String = "";
      
      private var var_1612:int = 0;
      
      private var var_2361:int = 0;
      
      private var var_2006:Number = NaN;
      
      private var var_2200:int = -1;
      
      private var var_2201:int = -1;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_566 = new Map();
         this.var_978 = false;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1172;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_566 != null)
         {
            _loc1_ = this.var_566.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_566.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_566.dispose();
         if(this.var_426)
         {
            this.var_426.dispose();
         }
         this.var_426 = null;
         this.var_750 = null;
         this.var_1172 = true;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_750 = param1 as PetVisualizationData;
         createSprites(this.const_1636);
         var _loc2_:BitmapData = (this.var_750.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset).content as BitmapData;
         this.var_426 = new ExperienceData(_loc2_.clone());
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_145)
         {
            this.var_2197 = param1.getNumber(RoomObjectVariableEnum.const_256) > 0;
            this.var_1611 = param1.getString(RoomObjectVariableEnum.const_177);
            this.var_309 = param1.getString(RoomObjectVariableEnum.const_304);
            this.var_1696 = param1.getString(RoomObjectVariableEnum.const_894);
            this.var_2006 = param1.getNumber(RoomObjectVariableEnum.const_231);
            this.var_1612 = param1.getNumber(RoomObjectVariableEnum.AVATAR_EXPERIENCE_TIMESTAMP);
            this.var_2361 = param1.getNumber(RoomObjectVariableEnum.const_443);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_238);
            if(this._figure != _loc3_)
            {
               this._figure = _loc3_;
               this.resetAvatarImages();
            }
            var_145 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_566)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_566.reset();
         this.var_67 = null;
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_2004 = false;
         switch(this.var_309)
         {
            case AvatarAction.const_544:
            case AvatarAction.const_1412:
            case AvatarAction.const_1271:
            case AvatarAction.const_1228:
            case AvatarAction.const_1378:
            case AvatarAction.const_1205:
            case AvatarAction.const_949:
            case AvatarAction.const_381:
            case AvatarAction.const_254:
               this.var_2004 = true;
         }
         this.var_2198 = false;
         this.var_1407 = false;
         if(this.var_309 == "lay")
         {
            this.var_1407 = true;
            _loc1_ = int(this.var_1696);
            if(_loc1_ < 0)
            {
               this.var_2198 = true;
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_520 != param1.getUpdateID() || this.var_1881 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_2006;
            if(isNaN(this.var_2006))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_2200 || param3)
            {
               this.var_2200 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_67.setDirectionAngle(AvatarSetType.const_42,_loc4_);
            }
            if(_loc5_ != this.var_2201 || param3)
            {
               this.var_2201 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_67.setDirectionAngle(AvatarSetType.const_54,_loc5_);
            }
            var_520 = param1.getUpdateID();
            this.var_1881 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_566.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_750.getAvatar(this._figure,param1,this);
            if(_loc3_ != null)
            {
               this.var_566.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2116);
         this.var_749 = null;
         _loc2_ = getSprite(this.const_2116);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
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
         if(this.var_749)
         {
            _loc2_.asset = this.var_749.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 0.005;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
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
         if(this.var_2005)
         {
            this.var_2005 = false;
            this.var_1327 = 0;
            this.var_1328 = 1;
            this.resetAvatarImages();
         }
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = this.updateModel(_loc6_,_loc7_);
         if(_loc10_ || _loc7_ != var_101 || this.var_67 == null)
         {
            if(_loc7_ != var_101)
            {
               var_101 = _loc7_;
               _loc8_ = true;
            }
            if(_loc8_ || this.var_67 == null)
            {
               this.var_67 = this.getAvatarImage(_loc7_);
            }
            if(this.var_67 == null)
            {
               return;
            }
            if(_loc8_)
            {
               this.updateShadow(_loc7_);
            }
            _loc9_ = this.updateObject(_loc5_,param1,true);
            this.updateActions(this.var_67);
         }
         else
         {
            _loc9_ = this.updateObject(_loc5_,param1);
         }
         var _loc11_:Boolean = _loc9_ || _loc10_ || _loc8_;
         var _loc12_:Boolean = this.var_978 || this.var_1328 > 0 || this.var_2004;
         this.var_426.alpha = 0;
         if(this.var_1612 > 0)
         {
            _loc13_ = param2 - this.var_1612;
            if(_loc13_ < AvatarAction.const_1164)
            {
               this.var_426.alpha = int(Math.sin(_loc13_ / 0 * 0) * 255);
               this.var_426.setExperience(this.var_2361);
               this.var_1328 = this.const_2394;
            }
            else
            {
               this.var_1612 = 0;
            }
            _loc14_ = getSprite(this.const_2129);
            if(_loc14_ != null)
            {
               if(this.var_426.alpha > 0)
               {
                  _loc14_.asset = this.var_426.image;
                  _loc14_.offsetX = -20;
                  _loc14_.offsetY = -80;
                  _loc14_.alpha = this.var_426.alpha;
                  _loc14_.visible = true;
               }
               else
               {
                  _loc14_.asset = null;
                  _loc14_.visible = false;
               }
            }
         }
         if(_loc11_ || _loc12_)
         {
            increaseUpdateId();
            --this.var_1328;
            ++this.var_624;
            --this.var_1327;
            if(!(this.var_1327 <= 0 || _loc8_))
            {
               return;
            }
            this.var_67.updateAnimationByFrames(1);
            this.var_1327 = const_1161;
            this.var_978 = this.var_67.isAnimating();
            _loc15_ = this.var_67.getCanvasOffsets();
            if(_loc15_ == null || _loc15_.length < 3)
            {
               _loc15_ = const_1637;
            }
            _loc16_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc16_ = Math.min(_loc7_ / 2.75,0);
            }
            _loc14_ = getSprite(this.const_1160);
            if(_loc14_)
            {
               _loc19_ = this.var_67.getImage(AvatarSetType.const_42,false);
               if(_loc19_ != null)
               {
                  _loc14_.asset = _loc19_;
               }
               if(_loc7_ < 48)
               {
                  _loc14_.offsetX = -16 + _loc15_[0];
                  _loc14_.offsetY = -_loc14_.asset.height + 8 + _loc15_[1] + _loc16_;
               }
               else
               {
                  _loc14_.offsetX = -32 + _loc15_[0];
                  _loc14_.offsetY = -_loc14_.asset.height + 16 + _loc15_[1] + _loc16_;
               }
            }
            _loc17_ = this.const_1636;
            for each(_loc18_ in this.var_67.getSprites())
            {
               _loc14_ = getSprite(_loc17_);
               if(_loc14_ != null)
               {
                  _loc20_ = this.var_67.getLayerData(_loc18_);
                  _loc21_ = 0;
                  _loc22_ = _loc18_.getDirectionOffsetX(this.var_67.getDirection());
                  _loc23_ = _loc18_.getDirectionOffsetY(this.var_67.getDirection());
                  _loc24_ = _loc18_.getDirectionOffsetZ(this.var_67.getDirection());
                  _loc25_ = 0;
                  if(_loc18_.hasDirections)
                  {
                     _loc25_ = this.var_67.getDirection();
                  }
                  if(_loc20_ != null)
                  {
                     _loc21_ = _loc20_.animationFrame;
                     _loc22_ += _loc20_.dx;
                     _loc23_ += _loc20_.dy;
                     _loc25_ += _loc20_.directionOffset;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  if(_loc25_ < 0)
                  {
                     _loc25_ += 8;
                  }
                  if(_loc25_ > 7)
                  {
                     _loc25_ -= 8;
                  }
                  _loc26_ = this.var_67.getScale() + "_" + _loc18_.member + "_" + _loc25_ + "_" + _loc21_;
                  _loc27_ = this.var_67.getAsset(_loc26_);
                  if(_loc27_ != null)
                  {
                     _loc14_.asset = _loc27_.content as BitmapData;
                     _loc14_.offsetX = -1 * _loc27_.offset.x - _loc7_ / 2 + _loc22_;
                     _loc14_.offsetY = -1 * _loc27_.offset.y + _loc23_;
                     _loc14_.relativeDepth = -0.01 - 0.1 * _loc17_ * _loc24_;
                     if(_loc18_.ink == 33)
                     {
                        _loc14_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc14_.blendMode = BlendMode.NORMAL;
                     }
                     _loc17_++;
                  }
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_428,this.var_309,this.var_1696);
         if(this.var_1611 != null && this.var_1611 != "")
         {
            param1.appendAction(AvatarAction.const_383,this.var_1611);
         }
         if(this.var_2197 || this.var_1697)
         {
            param1.appendAction(AvatarAction.const_603);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1636;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function imageReady() : void
      {
         this.var_2005 = true;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
   }
}
