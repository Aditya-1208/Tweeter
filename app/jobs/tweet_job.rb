class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # many updates on tweet => schedule multiple jobs, but we'll run only latest time
    return if (tweet.published? || tweet.publish_at > Time.current)
    tweet.publish_to_twitter!
  end
end
