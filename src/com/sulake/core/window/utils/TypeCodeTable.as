package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_770;
         param1["badge"] = const_1014;
         param1["bitmap"] = const_441;
         param1["border"] = const_880;
         param1["border_notify"] = const_1845;
         param1["bubble"] = const_1004;
         param1["bubble_pointer_up"] = const_1296;
         param1["bubble_pointer_right"] = const_1395;
         param1["bubble_pointer_down"] = const_1362;
         param1["bubble_pointer_left"] = const_1233;
         param1["button"] = const_611;
         param1["button_thick"] = const_1000;
         param1["button_icon"] = const_1961;
         param1["button_group_left"] = const_886;
         param1["button_group_center"] = const_939;
         param1["button_group_right"] = const_988;
         param1["canvas"] = const_746;
         param1["checkbox"] = const_806;
         param1["closebutton"] = const_1264;
         param1["container"] = const_440;
         param1["container_button"] = const_984;
         param1["display_object_wrapper"] = const_879;
         param1["dropmenu"] = const_568;
         param1["dropmenu_item"] = const_601;
         param1["frame"] = const_452;
         param1["frame_notify"] = const_2065;
         param1["header"] = const_971;
         param1["html"] = const_1371;
         param1["icon"] = const_1350;
         param1["itemgrid"] = const_1345;
         param1["itemgrid_horizontal"] = const_652;
         param1["itemgrid_vertical"] = const_825;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_398;
         param1["itemlist_vertical"] = const_463;
         param1["label"] = const_808;
         param1["maximizebox"] = const_1834;
         param1["menu"] = const_1797;
         param1["menu_item"] = const_1843;
         param1["submenu"] = const_1428;
         param1["minimizebox"] = const_1829;
         param1["notify"] = const_1972;
         param1["RoomsWithHighestScoreSearchMessageComposer"] = const_829;
         param1["password"] = const_959;
         param1["radiobutton"] = const_767;
         param1["region"] = const_339;
         param1["restorebox"] = const_1920;
         param1["scaler"] = const_639;
         param1["scaler_horizontal"] = const_1814;
         param1["scaler_vertical"] = const_1891;
         param1["scrollbar_horizontal"] = const_677;
         param1["scrollbar_vertical"] = const_874;
         param1["scrollbar_slider_button_up"] = const_1380;
         param1["scrollbar_slider_button_down"] = const_1274;
         param1["scrollbar_slider_button_left"] = const_1177;
         param1["scrollbar_slider_button_right"] = const_1227;
         param1["scrollbar_slider_bar_horizontal"] = const_1266;
         param1["scrollbar_slider_bar_vertical"] = const_1358;
         param1["scrollbar_slider_track_horizontal"] = const_1322;
         param1["scrollbar_slider_track_vertical"] = const_1221;
         param1["scrollable_itemlist"] = const_1890;
         param1["scrollable_itemlist_vertical"] = const_540;
         param1["scrollable_itemlist_horizontal"] = const_1407;
         param1["selector"] = const_937;
         param1["selector_list"] = const_932;
         param1["submenu"] = const_1428;
         param1["tab_button"] = const_847;
         param1["tab_container_button"] = const_1339;
         param1["tab_context"] = const_447;
         param1["tab_content"] = const_1186;
         param1["tab_selector"] = const_979;
         param1["text"] = const_1001;
         param1["input"] = const_998;
         param1["toolbar"] = const_1773;
         param1["tooltip"] = const_427;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
