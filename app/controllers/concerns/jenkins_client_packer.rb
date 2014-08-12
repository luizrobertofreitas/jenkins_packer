require 'zip'

module JenkinsClientPacker extend ActiveSupport::Concern

	def jenkins_connection
		return JenkinsApi::Client.new(:server_ip => "localhost", :username => "luizrobertofreitas", :password => "pomarola")
	end

	def load_files_from_maven_dir

		config = JenkinsAppConfig.first

		return Dir[config.directory]
	end

	def get_maven_dir_name
		config = JenkinsAppConfig.first
		return config.directory
	end

	def load_builds_dir
		config = JenkinsAppConfig.first

		return config.builds_directory
	end

	def load_files_from_build_dir
		config = JenkinsAppConfig.first

		return Dir[config.builds_directory]
	end

	def zip_folder(directory)
		filenames = Dir[directory]

  		zip_filename = directory + ".zip"

  		Zip::File.open(zip_filename, Zip::File::CREATE) do |zipfile|
		    Dir[File.join(directory, '**', '**')].each do |file|
		      zipfile.add(file.sub(directory+"/", ''), file)
		    end
		end
	end

	## Get some operations on: https://github.com/arangamani/jenkins_api_client/blob/master/lib/jenkins_api_client/job.rb

end