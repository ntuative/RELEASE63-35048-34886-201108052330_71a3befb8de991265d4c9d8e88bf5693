package com.sulake.habbo.avatar.structure
{
   import flash.geom.Point;
   
   public class AvatarCanvas
   {
       
      
      private var _id:String;
      
      private var var_230:int;
      
      private var _height:int;
      
      private var var_1356:int;
      
      private var var_1496:int;
      
      private var _dx:int;
      
      private var _offset:Point;
      
      public function AvatarCanvas(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this.var_230 = parseInt(param1.@width);
         this._height = parseInt(param1.@height);
         this.var_1356 = parseInt(param1.@depth);
         this._dx = parseInt(param1.@dx);
         this.var_1496 = parseInt(param1.@dy);
         this._offset = new Point(this._dx,this.var_1496);
      }
      
      public function get width() : int
      {
         return this.var_230;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get id() : String
      {
         return this._id;
      }
   }
}
