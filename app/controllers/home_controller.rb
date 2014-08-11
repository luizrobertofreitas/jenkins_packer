class HomeController < ApplicationController
  
  include JenkinsClientPacker

  def index
	files = load_files_from_maven_dir()

	@result = Array.new

	files.each do |f|
		md5 = Digest::MD5.file(f).hexdigest
		@result.push({:file => f, :md5 => md5})
	end
	
  end

  def select_files

  	@result = Array.new

  	directory_name = "/natura-" + Time.now.strftime("%Y-%m-%d-%H:%M:%S")

	build_directory = load_builds_dir()
	build_directory = build_directory + directory_name

	puts " >>>>>>>>>>>>>>>>> #{build_directory}"

	FileUtils.mkdir_p(build_directory)

  	params['file_check'].each do |key, value|
		@result.push({:file => value, :md5 => key})
		FileUtils.cp(value, build_directory)
  	end
  end

end
