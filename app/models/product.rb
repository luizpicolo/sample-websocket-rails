class Product < ActiveRecord::Base
  def analytics_view_in_home
    view = 0;
    view = $redis.get("view_in_home_#{self.id}")
    $redis.set("view_in_home_#{self.id}", (view.to_i + 1))
  end

  def analytics_view_click
    view = 0;
    view = $redis.get("view_click_#{self.id}")
    $redis.set("view_click_#{self.id}", (view.to_i + 1))
  end

  def analytics_show_by_id(id)
    $redis.get(id)
  end
end
