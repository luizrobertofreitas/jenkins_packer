class JenkinsAppConfig
  include Mongoid::Document
  field :directory, type: String
  field :builds_directory, type: String
end
