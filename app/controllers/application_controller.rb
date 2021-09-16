class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  
  get "/tweets" do
    @user = User.find_by(id: params["user_id"])

    if @user
      @tweets = @user.tweets
      @tweets.to_json
    else
      { message: "Try loggin in again." }.to_json
    end
  end


  delete "/tweets/:id" do
    @tweet = Tweet.find_by(id: params[:id])

    if @tweet.user_id == params["user_id"].to_i
      @tweet.destroy
      { message: "Tweet was deleted.." }.to_json
    else
      { message: "You're not authorized.. STAPH!!" }.to_json
    end
  end























  post "/signup" do
    if User.find_by(username: user_params["username"])
      { message: "Username exists. Please login..." }.to_json
    else
      @user = User.create(user_params)
      # @user.to_json
      { message: "Sign up was a success! now go and login..." }.to_json
    end
  end

  post "/login" do
    if User.find_by(username: user_params["username"])
      
      @user = User.find_by(username: user_params["username"])
      
      if @user.password == user_params["password"]
        { user: @user, message: "Logged in successfully..."}.to_json
      else
        { message: "Username OR Password incorrect! Try again.." }.to_json
      end

    else
      { message: "User doesn't exists. Please signup..." }.to_json
    end
  end

  private
  def user_params
    allowed_params = %w(username password)
    params.select{ |param, value| allowed_params.include?(param) }
  end

end
