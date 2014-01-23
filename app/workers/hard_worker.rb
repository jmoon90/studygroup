class HardWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options retry: false

  recurrence { minutely.second_of_minute(0,30) }

  def perform
    Learning.pluck(:id).each do |id|
      learning = Learning.find(id)
      vote_count = learning.votes_count
      Learning.rank_learning(learning, vote_count)
    end
  end
end
