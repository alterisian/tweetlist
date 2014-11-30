json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :value, :tweeter_id, :list_id, :hashtag_id
  json.url tweet_url(tweet, format: :json)
end
