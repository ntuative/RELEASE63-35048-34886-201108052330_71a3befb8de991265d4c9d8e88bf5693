package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_150:Stage;
      
      private static var var_321:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_792:Boolean = true;
      
      private static var var_127:DisplayObject;
      
      private static var var_1482:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_150 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_127)
            {
               var_150.removeChild(var_127);
               var_150.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_150.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_150.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_150.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_792 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_321;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_321 = param1;
         if(var_321)
         {
            if(var_127)
            {
               var_127.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_127)
         {
            var_127.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_792)
         {
            _loc1_ = var_1482[_type];
            if(_loc1_)
            {
               if(var_127)
               {
                  var_150.removeChild(var_127);
               }
               else
               {
                  var_150.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_150.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_150.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_150.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_127 = _loc1_;
               var_150.addChild(var_127);
            }
            else
            {
               if(var_127)
               {
                  var_150.removeChild(var_127);
                  var_150.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_150.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_150.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_150.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_127 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_325:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_907:
                  case MouseCursorType.const_257:
                  case MouseCursorType.const_2053:
                  case MouseCursorType.const_1922:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_792 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1482[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_127)
         {
            var_127.x = param1.stageX - 2;
            var_127.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_321 = false;
               Mouse.show();
            }
            else
            {
               var_321 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_127 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_321 = false;
         }
      }
   }
}
