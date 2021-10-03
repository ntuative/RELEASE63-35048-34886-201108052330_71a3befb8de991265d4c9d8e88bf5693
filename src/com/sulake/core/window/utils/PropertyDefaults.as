package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.Direction;
   import com.sulake.core.window.enum.LinkTarget;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextFieldAutoSize;
   
   public class PropertyDefaults
   {
      
      public static const const_965:String = "antialias_type";
      
      public static const const_790:String = "auto_arrange_items";
      
      public static const const_897:String = "auto_size";
      
      public static const const_758:String = "bitmap_asset_name";
      
      public static const const_938:String = "direction";
      
      public static const const_1272:String = "display_as_password";
      
      public static const const_900:String = "editable";
      
      public static const const_928:String = "focus_capturer";
      
      public static const const_1351:String = "grid_fit_type";
      
      public static const const_791:String = "handle_bitmap_disposing";
      
      public static const const_775:String = "link_target";
      
      public static const const_424:String = "spacing";
      
      public static const const_268:String = "margin_left";
      
      public static const const_302:String = "margin_top";
      
      public static const const_277:String = "margin_right";
      
      public static const const_282:String = "margin_bottom";
      
      public static const const_898:String = "item_array";
      
      public static const const_1002:String = "mouse_wheel_enabled";
      
      public static const const_1011:String = "pointer_offset";
      
      public static const const_909:String = "resize_on_item_update";
      
      public static const const_972:String = "scale_to_fit_items";
      
      public static const const_849:String = "scroll_step_h";
      
      public static const const_883:String = "scroll_step_v";
      
      public static const const_851:String = "selectable";
      
      public static const const_458:String = "text_color";
      
      public static const const_400:String = "text_style";
      
      public static const const_888:String = "tool_tip_caption";
      
      public static const const_885:String = "tool_tip_delay";
      
      public static const const_2298:String = "test_id_key";
      
      public static const const_2046:String = AntiAliasType.NORMAL;
      
      public static const const_1268:Array = [AntiAliasType.NORMAL,AntiAliasType.ADVANCED];
      
      public static const const_1413:Boolean = true;
      
      public static const const_1290:String = TextFieldAutoSize.NONE;
      
      public static const const_1324:Array = [TextFieldAutoSize.NONE,TextFieldAutoSize.LEFT,TextFieldAutoSize.CENTER,TextFieldAutoSize.RIGHT];
      
      public static const const_1326:String = null;
      
      public static const const_1816:String = Direction.DOWN;
      
      public static const const_1974:Array = [Direction.UP,Direction.DOWN,Direction.LEFT,Direction.RIGHT];
      
      public static const const_1282:Boolean = false;
      
      public static const const_1808:Boolean = true;
      
      public static const const_1279:Boolean = false;
      
      public static const const_1375:String = GridFitType.PIXEL;
      
      public static const const_1229:Array = [GridFitType.PIXEL,GridFitType.NONE,GridFitType.SUBPIXEL];
      
      public static const const_1356:Boolean = true;
      
      public static const HTML_LINK_TARGET_VALUE:String = LinkTarget.const_30;
      
      public static const const_962:Array = [LinkTarget.const_30,LinkTarget.name_3,LinkTarget.const_1786,LinkTarget.const_1887,LinkTarget.const_1899,LinkTarget.const_1397];
      
      public static const const_764:int = 0;
      
      public static const const_837:int = 0;
      
      public static const const_875:int = 0;
      
      public static const const_992:int = 0;
      
      public static const const_836:int = 0;
      
      public static const const_1776:Array = [];
      
      public static const const_1193:Boolean = true;
      
      public static const const_2038:int = 0;
      
      public static const const_1238:Boolean = false;
      
      public static const const_1191:Boolean = false;
      
      public static const const_1207:Number = -1;
      
      public static const const_1317:Number = -1;
      
      public static const const_1196:Boolean = true;
      
      public static const const_910:uint = 0;
      
      public static const const_1806:String = TextStyleManager.const_224;
      
      public static const const_831:Array = TextStyleManager.getStyleNameArrayRef();
      
      public static const const_663:String = "";
      
      public static const const_1336:int = 500;
      
      public static const const_2204:PropertyStruct = new PropertyStruct(const_965,const_2046,PropertyStruct.const_52,false,const_1268);
      
      public static const const_1915:PropertyStruct = new PropertyStruct(const_790,const_1413,PropertyStruct.const_38,false);
      
      public static const const_2023:PropertyStruct = new PropertyStruct(const_897,const_1290,PropertyStruct.const_52,false,const_1324);
      
      public static const const_1762:PropertyStruct = new PropertyStruct(const_758,const_1326,PropertyStruct.const_52,false);
      
      public static const const_1807:PropertyStruct = new PropertyStruct(const_938,const_1816,PropertyStruct.const_52,false,const_1974);
      
      public static const const_2040:PropertyStruct = new PropertyStruct(const_1272,const_1282,PropertyStruct.const_38,false);
      
      public static const const_2020:PropertyStruct = new PropertyStruct(const_900,const_1808,PropertyStruct.const_38,false);
      
      public static const const_2047:PropertyStruct = new PropertyStruct(const_928,const_1279,PropertyStruct.const_38,false);
      
      public static const const_1953:PropertyStruct = new PropertyStruct(const_1351,const_1375,PropertyStruct.const_52,false,const_1229);
      
      public static const const_1944:PropertyStruct = new PropertyStruct(const_791,const_1356,PropertyStruct.const_38,false);
      
      public static const const_1937:PropertyStruct = new PropertyStruct(const_775,HTML_LINK_TARGET_VALUE,PropertyStruct.const_52,false,const_962);
      
      public static const const_1178:PropertyStruct = new PropertyStruct(const_424,const_764,PropertyStruct.const_39,false);
      
      public static const const_838:PropertyStruct = new PropertyStruct(const_268,const_837,PropertyStruct.const_39,false);
      
      public static const const_967:PropertyStruct = new PropertyStruct(const_302,const_875,PropertyStruct.const_39,false);
      
      public static const const_832:PropertyStruct = new PropertyStruct(const_277,const_992,PropertyStruct.const_39,false);
      
      public static const const_1008:PropertyStruct = new PropertyStruct(const_282,const_836,PropertyStruct.const_39,false);
      
      public static const const_1935:PropertyStruct = new PropertyStruct(const_898,const_1776,PropertyStruct.const_167,false);
      
      public static const const_1802:PropertyStruct = new PropertyStruct(const_1002,const_1193,PropertyStruct.const_38,false);
      
      public static const const_1879:PropertyStruct = new PropertyStruct(const_909,const_1238,PropertyStruct.const_38,false);
      
      public static const const_2011:PropertyStruct = new PropertyStruct(const_1011,const_2038,PropertyStruct.const_39,false);
      
      public static const const_1783:PropertyStruct = new PropertyStruct(const_972,const_1191,PropertyStruct.const_38,false);
      
      public static const const_1888:PropertyStruct = new PropertyStruct(const_849,const_1207,PropertyStruct.const_136,false);
      
      public static const const_1956:PropertyStruct = new PropertyStruct(const_883,const_1317,PropertyStruct.const_136,false);
      
      public static const const_1912:PropertyStruct = new PropertyStruct(const_851,const_1196,PropertyStruct.const_38,false);
      
      public static const const_1202:PropertyStruct = new PropertyStruct(const_458,const_910,PropertyStruct.const_159,false);
      
      public static const const_1393:PropertyStruct = new PropertyStruct(const_400,const_1806,PropertyStruct.const_52,false,const_831);
      
      public static const const_1809:PropertyStruct = new PropertyStruct(const_888,const_663,PropertyStruct.const_52,false);
      
      public static const TOOL_TIP_DELAY:PropertyStruct = new PropertyStruct(const_885,const_1336,PropertyStruct.const_298,false);
       
      
      public function PropertyDefaults()
      {
         super();
      }
   }
}
