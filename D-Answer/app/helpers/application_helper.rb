module ApplicationHelper
  def devise_mapping
      Devise.mappings[:user]
  end

  def is_user?(user)
    usr_role = Role.find(:first, :conditions => ["name = ?", "User"])
    return user.roles.include?(usr_role)
  end

  def is_admin?(user)
    admin_role = Role.find(:first, :conditions => ["name = ?", "Admin"])
    return user.roles.include?(admin_role)
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
