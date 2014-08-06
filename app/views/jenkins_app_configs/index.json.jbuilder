json.array!(@jenkins_app_configs) do |jenkins_app_config|
  json.extract! jenkins_app_config, :id, :directory
  json.url jenkins_app_config_url(jenkins_app_config, format: :json)
end
