class HomeController < ApplicationController
  
  include JenkinsClientPacker

  def index
	files = load_files_from_maven_dir()

	@result = Array.new

	files.each do |f|
		md5 = Digest::MD5.file(f).hexdigest
		@result.push(Hash.new(:file => f, :md5 => md5))
	end
  end

end
