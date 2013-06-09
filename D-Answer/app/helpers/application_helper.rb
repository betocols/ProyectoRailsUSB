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
end
