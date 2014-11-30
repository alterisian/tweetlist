class TweetersController < ApplicationController
  before_action :set_tweeter, only: [:show, :edit, :update, :destroy, :vote]

  # GET /tweeters
  # GET /tweeters.json
  def index
    @tweeters = Tweeter.all
  end

  # GET /tweeters/1
  # GET /tweeters/1.json
  def show
  end

  # GET /tweeters/new
  def new
    @tweeter = Tweeter.new
  end

  # GET /tweeters/1/edit
  def edit
  end

  # POST /tweeters
  # POST /tweeters.json
  def create
    @tweeter = Tweeter.new(tweeter_params)

    respond_to do |format|
      if @tweeter.save
        format.html { redirect_to @tweeter, notice: 'Tweeter was successfully created.' }
        format.json { render :show, status: :created, location: @tweeter }
      else
        format.html { render :new }
        format.json { render json: @tweeter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweeters/1
  # PATCH/PUT /tweeters/1.json
  def update
    respond_to do |format|
      if @tweeter.update(tweeter_params)
        format.html { redirect_to @tweeter, notice: 'Tweeter was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweeter }
      else
        format.html { render :edit }
        format.json { render json: @tweeter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeters/1
  # DELETE /tweeters/1.json
  def destroy
    @tweeter.destroy
    respond_to do |format|
      format.html { redirect_to tweeters_url, notice: 'Tweeter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @tweeter.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweeter
      @tweeter = Tweeter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweeter_params
      params.require(:tweeter).permit(:handle, :access_token, :access_token_secret, :followers, :following, :influence, :tweet_count)
    end
end
