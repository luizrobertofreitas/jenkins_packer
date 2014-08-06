module JenkinsClientPacker extend ActiveSupport::Concern

	def jenkins_connection
		return JenkinsApi::Client.new(:server_ip => "localhost", :username => "luizrobertofreitas", :password => "pomarola")
	end

	def load_files_from_maven_dir()

		config = JenkinsAppConfig.first

		return Dir[config.directory]
	end

	## Get some operations on: https://github.com/arangamani/jenkins_api_client/blob/master/lib/jenkins_api_client/job.rb

end