class RunsController < ApplicationController
  before_action :authenticate_user!, except: :leaderboard
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  # GET /runs
  # GET /runs.json
  def index
    @runs = current_user.runs.order(date_of: :desc, created_at: :desc)
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @run = current_user.runs.new
    @run.date_of = Time.zone.today
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = current_user.runs.new(run_params)
    @run.date_of = Date.strptime(params[:run][:date_of], '%m/%d/%Y') if !params[:run][:date_of].blank?

    respond_to do |format|
      if @run.save
        format.html { redirect_to runs_url, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    formatted_run_params = run_params
    formatted_run_params[:date_of] = Date.strptime(params[:run][:date_of], '%m/%d/%Y') if !params[:run][:date_of].blank?
    respond_to do |format|
      if @run.update(formatted_run_params)
        format.html { redirect_to runs_url, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def leaderboard
    @users = User.all.map { |u| { name: u.name, total_distance: u.runs.where("date_of >= ?", "2016-01-01").sum(:distance) } }
    @users = @users.sort_by { |u| -u[:total_distance] }
    @user_names = @users.map { |u| u[:name] }
    @user_distances = @users.map { |u| u[:total_distance].to_f }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = current_user.runs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:date_of, :distance, :user_id)
    end
end
