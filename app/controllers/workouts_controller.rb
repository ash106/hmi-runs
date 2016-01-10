class WorkoutsController < ApplicationController
  before_action :authenticate_user!, except: :leaderboard
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = current_user.workouts.order(date_of: :desc, created_at: :desc)
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = current_user.workouts.new
    @workout.date_of = Time.zone.today
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = current_user.workouts.new(workout_params)
    @workout.date_of = Date.strptime(params[:workout][:date_of], '%m/%d/%Y') if !params[:workout][:date_of].blank?

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workouts_url, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    formatted_workout_params = workout_params
    formatted_workout_params[:date_of] = Date.strptime(params[:workout][:date_of], '%m/%d/%Y') if !params[:workout][:date_of].blank?
    respond_to do |format|
      if @workout.update(formatted_workout_params)
        format.html { redirect_to workouts_url, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def leaderboard
    @users = User.all.map { |u| { name: u.name, total_time: u.workouts.sum(:length) } }
    @users = @users.sort_by { |u| -u[:total_time] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:date_of, :length, :user_id)
    end
end
