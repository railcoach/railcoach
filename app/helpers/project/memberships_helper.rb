module Project::MembershipsHelper

  def role_line(membership)
    role_line = ''
    membership.roles.each do |role|
      role_line << role.name
      role_line << ', ' unless role == membership.roles.last
    end
    role_line
  end

end
