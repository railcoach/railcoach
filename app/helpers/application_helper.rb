module ApplicationHelper
  # Returns an array with role names
  def roles_on_project?(user_id, project_id)
    user = User.find(user_id)
    roles = user.memberships.find(:project_id => project_id).roles
    roles.each { |r| r.name.collect }
  end
end
