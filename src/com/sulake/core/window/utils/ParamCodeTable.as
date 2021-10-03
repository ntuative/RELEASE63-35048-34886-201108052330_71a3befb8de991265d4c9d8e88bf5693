package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["RoomsWithHighestScoreSearchMessageComposer"] = const_196;
         param1["bound_to_parent_rect"] = const_105;
         param1["child_window"] = const_1312;
         param1["embedded_controller"] = const_1353;
         param1["expand_to_accommodate_children"] = WINDOW_PARAM_EXPAND_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_29;
         param1["internal_event_handling"] = const_948;
         param1["mouse_dragging_target"] = const_297;
         param1["mouse_dragging_trigger"] = const_401;
         param1["mouse_scaling_target"] = const_353;
         param1["mouse_scaling_trigger"] = const_591;
         param1["horizontal_mouse_scaling_trigger"] = const_305;
         param1["vertical_mouse_scaling_trigger"] = const_296;
         param1["observe_parent_input_events"] = const_1301;
         param1["parent_window"] = const_1409;
         param1["resize_to_accommodate_children"] = const_188;
         param1["relative_horizontal_scale_center"] = const_218;
         param1["relative_horizontal_scale_fixed"] = const_146;
         param1["relative_horizontal_scale_move"] = const_327;
         param1["relative_horizontal_scale_strech"] = const_433;
         param1["relative_scale_center"] = const_1203;
         param1["relative_scale_fixed"] = const_1019;
         param1["relative_scale_move"] = const_1386;
         param1["relative_scale_strech"] = const_1280;
         param1["relative_vertical_scale_center"] = const_213;
         param1["relative_vertical_scale_fixed"] = const_151;
         param1["relative_vertical_scale_move"] = const_315;
         param1["relative_vertical_scale_strech"] = const_273;
         param1["on_resize_align_left"] = const_744;
         param1["on_resize_align_right"] = const_604;
         param1["on_resize_align_center"] = const_626;
         param1["on_resize_align_top"] = const_799;
         param1["on_resize_align_bottom"] = const_614;
         param1["on_resize_align_middle"] = const_673;
         param1["on_accommodate_align_left"] = const_1257;
         param1["on_accommodate_align_right"] = const_508;
         param1["on_accommodate_align_center"] = const_870;
         param1["on_accommodate_align_top"] = const_1382;
         param1["on_accommodate_align_bottom"] = const_546;
         param1["on_accommodate_align_middle"] = const_860;
         param1["route_input_events_to_parent"] = const_644;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1368;
         param1["scalable_with_mouse"] = const_1254;
         param1["reflect_horizontal_resize_to_parent"] = const_605;
         param1["reflect_vertical_resize_to_parent"] = const_569;
         param1["reflect_resize_to_parent"] = const_336;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1388;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
