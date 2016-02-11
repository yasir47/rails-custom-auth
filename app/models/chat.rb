class Chat < ApplicationRecord
  self.table_name = 'posts'
  belongs_to :user
  belongs_to :room

  after_create_commit { ChatBroadcastJob.perform_later self }
end