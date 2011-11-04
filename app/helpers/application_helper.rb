module ApplicationHelper
  # Returns an array with role names
  def roles_on_project?(user_id, project_id)
    user = User.find(user_id)
    roles = user.memberships.find(:project_id => project_id).roles
    roles.each { |r| r.name.collect }
  end

  # Timon Vonk
  # Easilly creates an auth url for a network, takes a network as a string. Would be cool if it read omniauth config instead for whitelisting
  def user_auth_helper_path(network)
    # TODO: Needs to get networks from config or user
    allowed_networks = Rails.configuration.allowed_networks

    network = network.to_sym

    if allowed_networks.has_key?(network)
      if allowed_networks[network][:method] == :open_id
        user_omniauth_authorize_path(allowed_networks[network][:method], :openid_url => allowed_networks[network][:url])
      else
        user_omniauth_authorize_path(allowed_networks[network][:method])
      end
    else
      raise 'Unkown authentication method'
    end
  end

  # Convert a markdown text to HTML and sanitize it.
  def markdown(text)
    raw sanitize Markdown.new(text).to_html
  end
end
