class HomeController < ApplicationController
  
  include JenkinsClientPacker

  def index
	files = load_files_from_maven_dir()

	@result = Array.new

	maven_dir_name = get_maven_dir_name()

	files.each do |f|
		md5 = Digest::MD5.file(f).hexdigest
		sha1 = Digest::SHA2.file(f).hexdigest

		dir_to_clean = f[/.*\//]

		hr_file = f.sub(dir_to_clean, "")

		@result.push({:file => f, :md5 => md5, :sha1 => sha1, :hr_file => hr_file})
	end
	
  end

  def select_files

  	@result = Array.new

  	directory_name = "/natura-" + Time.now.strftime("%Y-%m-%d-%H:%M:%S")

	build_directory = load_builds_dir()
	build_directory = build_directory + directory_name

	FileUtils.mkdir_p(build_directory)

  	params['file_check'].each do |key, value|
		@result.push({:file => value, :md5 => key, :sha1 => (Digest::SHA2.file(value).hexdigest), :hr_file => value.sub(value[/.*\//], "")})
		FileUtils.cp(value, build_directory)
  	end

  	@result_for_checksum = @result

  	@result_for_checksum.each do |rfc|
  		rfc.except!(:file)
  	end

  	File.open(build_directory + "/checksum.txt", 'w') {
  		|file| file.write(JSON.pretty_generate(@result_for_checksum))
  	}

  	zip_folder(build_directory)

  end

end
