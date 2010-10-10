case Rails.env
when "development"
    AuthlogicConnect.config = YAML.load_file("config/authlogic.yml")
when "production"
    AuthlogicConnect.config = {
      :connect => {
        :openfoundry => {
          :key => "openfoundry_key",
          :secret => "openfoundry_secret",
          :label => "OpenFoundry"
        }
      }
    } 
end
