package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_343:int = 1;
      
      public static const const_230:int = 2;
      
      public static const const_280:int = 3;
      
      public static const const_362:int = 4;
      
      public static const const_251:int = 5;
      
      public static const const_421:int = 1;
      
      public static const const_813:int = 2;
      
      public static const const_970:int = 3;
      
      public static const const_804:int = 4;
      
      public static const const_253:int = 5;
      
      public static const const_866:int = 6;
      
      public static const const_801:int = 7;
      
      public static const const_432:int = 8;
      
      public static const const_674:int = 9;
      
      public static const const_2247:int = 10;
      
      public static const const_915:int = 11;
      
      public static const const_506:int = 12;
       
      
      private var var_479:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_479 = new Array();
         this.var_479.push(new Tab(this._navigator,const_343,const_506,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_557));
         this.var_479.push(new Tab(this._navigator,const_230,const_421,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_557));
         this.var_479.push(new Tab(this._navigator,const_362,const_915,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1237));
         this.var_479.push(new Tab(this._navigator,const_280,const_253,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_557));
         this.var_479.push(new Tab(this._navigator,const_251,const_432,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_1348));
         this.setSelectedTab(const_343);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_362;
      }
      
      public function get tabs() : Array
      {
         return this.var_479;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_479)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_479)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_479)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
