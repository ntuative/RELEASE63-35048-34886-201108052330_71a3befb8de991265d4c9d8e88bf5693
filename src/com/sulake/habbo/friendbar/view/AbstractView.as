package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDSessionDataManager;
   import iid.IIDHabboWindowManager;
   
   public class AbstractView extends Component
   {
       
      
      protected var _windowManager:IHabboWindowManager;
      
      protected var var_951:IAvatarRenderManager;
      
      protected var var_435:IHabboLocalizationManager;
      
      protected var var_761:IHabboConfigurationManager;
      
      protected var var_422:ISessionDataManager;
      
      public function AbstractView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         queueInterface(new IIDSessionDataManager(),this.onSessionManagerAvailable);
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationAvailable);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this._windowManager)
            {
               if(!this._windowManager.disposed)
               {
                  this._windowManager.release(new IIDHabboWindowManager());
                  this._windowManager = null;
               }
            }
            if(this.var_951)
            {
               if(!this.var_951.disposed)
               {
                  this.var_951.release(new IIDAvatarRenderManager());
                  this.var_951 = null;
               }
            }
            if(this.var_435)
            {
               if(!this.var_435.disposed)
               {
                  this.var_435.release(new IIDHabboLocalizationManager());
                  this.var_435 = null;
               }
            }
            if(this.var_761)
            {
               if(!this.var_761.disposed)
               {
                  this.var_761.release(new IIDHabboConfigurationManager());
                  this.var_761 = null;
               }
            }
            if(this.var_422)
            {
               if(!this.var_422.disposed)
               {
                  this.var_422.release(new IIDSessionDataManager());
                  this.var_422 = null;
               }
            }
            super.dispose();
         }
      }
      
      protected function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_951 = param2 as IAvatarRenderManager;
      }
      
      protected function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      protected function onLocalizationAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_435 = param2 as IHabboLocalizationManager;
      }
      
      protected function onConfigurationAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_761 = param2 as IHabboConfigurationManager;
      }
      
      protected function onSessionManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_422 = param2 as ISessionDataManager;
      }
   }
}
