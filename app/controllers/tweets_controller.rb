class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to "/tweets/#{@tweet.id}"
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweets = Tweet.all
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message, :author)
  end
end
