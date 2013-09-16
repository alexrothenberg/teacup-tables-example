class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    ctlr = TableViewController.new
    first = UINavigationController.alloc.initWithRootViewController(ctlr)
    @window.rootViewController = first
    @window.makeKeyAndVisible

    true
  end
end


class TableViewController < UITableViewController
  include Teacup::TableViewDelegate

  stylesheet :table

  def numberOfSectionsInTableView(table_view)
    1
  end

  def tableView(table_view, numberOfRowsInSection:section)
    6
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    title_height = 20
    details_height = index_path.row * 20
    title_height + details_height
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    cell = table_view.dequeueReusableCellWithIdentifier('cell id') ||
           UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue2, reuseIdentifier:'cell id')

    row = index_path.row
    layout(cell.contentView, :root) do
      subview(UILabel, :cell_title_label, :text => "title #{row}")
      row.times do |i|
        subview(UILabel, "cell_details_label_#{i+1}".to_sym, :text => "details #{row}-#{i}")
      end
    end

    cell
  end
end


Teacup::Stylesheet.new :table do
  style :cell_title_label,
    font: UIFont.boldSystemFontOfSize(20),
    constraints: [
      :top_left,
      :full_width,
      constrain_height(20),
    ]

  style :cell_details_label_1,
    constraints: [
      constrain_left(0),
      constrain_height(20),
      constrain_below(:cell_title_label)
    ]

  style :cell_details_label_2,
    constraints: [
      constrain_left(0),
      constrain_height(20),
      constrain_below(:cell_details_label_1)
    ]

  style :cell_details_label_3,
    constraints: [
      constrain_left(0),
      constrain_height(20),
      constrain_below(:cell_details_label_2)
    ]

  style :cell_details_label_4,
    constraints: [
      constrain_left(0),
      constrain_height(20),
      constrain_below(:cell_details_label_3)
    ]

  style :cell_details_label_5,
    constraints: [
      constrain_left(0),
      constrain_height(20),
      constrain_below(:cell_details_label_4)
    ]

  style :cell_details_label_6,
    constraints: [
      constrain_left(0),
      constrain_height(20),
      constrain_below(:cell_details_label_5)
    ]

end
