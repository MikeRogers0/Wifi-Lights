class ScheduleController < UIViewController
  def loadView
    @layout = ScheduleLayout.new
    self.view = @layout.view
  end
end
