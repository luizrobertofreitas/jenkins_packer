class JenkinsAppConfigsController < ApplicationController
  before_action :set_jenkins_app_config, only: [:show, :edit, :update, :destroy]

  # GET /jenkins_app_configs
  # GET /jenkins_app_configs.json
  def index
    @jenkins_app_configs = JenkinsAppConfig.all
  end

  # GET /jenkins_app_configs/1
  # GET /jenkins_app_configs/1.json
  def show
  end

  # GET /jenkins_app_configs/new
  def new
    @jenkins_app_config = JenkinsAppConfig.new
  end

  # GET /jenkins_app_configs/1/edit
  def edit
  end

  # POST /jenkins_app_configs
  # POST /jenkins_app_configs.json
  def create
    @jenkins_app_config = JenkinsAppConfig.new(jenkins_app_config_params)

    respond_to do |format|
      if @jenkins_app_config.save
        format.html { redirect_to @jenkins_app_config, notice: 'Jenkins app config was successfully created.' }
        format.json { render :show, status: :created, location: @jenkins_app_config }
      else
        format.html { render :new }
        format.json { render json: @jenkins_app_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jenkins_app_configs/1
  # PATCH/PUT /jenkins_app_configs/1.json
  def update
    respond_to do |format|
      if @jenkins_app_config.update(jenkins_app_config_params)
        format.html { redirect_to @jenkins_app_config, notice: 'Jenkins app config was successfully updated.' }
        format.json { render :show, status: :ok, location: @jenkins_app_config }
      else
        format.html { render :edit }
        format.json { render json: @jenkins_app_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jenkins_app_configs/1
  # DELETE /jenkins_app_configs/1.json
  def destroy
    @jenkins_app_config.destroy
    respond_to do |format|
      format.html { redirect_to jenkins_app_configs_url, notice: 'Jenkins app config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jenkins_app_config
      @jenkins_app_config = JenkinsAppConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jenkins_app_config_params
      params.require(:jenkins_app_config).permit(:directory)
      params.require(:jenkins_app_config).permit(:builds_directory)
    end
end
