class HardWorker
  include Sidekiq::Worker

  def perform(learning_id)
    learning = Learning.find(learning_id)
    learning.votes_count
    Learning.rank_learning(learning, learning.votes_count)
  end
end
