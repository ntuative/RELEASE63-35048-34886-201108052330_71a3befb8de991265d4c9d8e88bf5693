package com.sulake.habbo.avatar.head
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class HeadModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      public function HeadModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory(FigureData.const_210);
         initCategory(FigureData.const_272);
         initCategory(FigureData.const_283);
         initCategory(FigureData.const_288);
         initCategory(FigureData.const_309);
         _isInitialized = true;
         if(!_view)
         {
            _view = new HeadView(this,controller.manager.windowManager,controller.manager.assets);
            if(_view)
            {
               _view.init();
            }
         }
      }
   }
}
