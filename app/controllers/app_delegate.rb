class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    login_controller = ScheduleController.alloc.init

    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(login_controller)
    @window.makeKeyAndVisible
  end
end
