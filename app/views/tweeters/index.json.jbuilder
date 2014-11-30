json.array!(@tweeters) do |tweeter|
  json.extract! tweeter, :id, :handle, :access_token, :access_token_secret, :followers, :following, :influence, :tweet_count
  json.url tweeter_url(tweeter, format: :json)
end
