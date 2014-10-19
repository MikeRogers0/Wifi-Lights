class ScheduleLayout < MK::Layout
  view :table_view

  def layout
    background_color UIColor.blackColor
    @table_view = add UITableView, :table_view
  end

end
