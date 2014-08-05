class HomeController < ApplicationController
  
  def index
  	client = JenkinsApi::Client.new(:server_ip => "localhost", :username => "luizrobertofreitas", :password => "pomarola")
  	@jobs = client.job.list_all_with_details
  end

end
