class Chat < ApplicationRecord
  self.table_name = 'posts'
  belongs_to :user
  after_create_commit { ChatBroadcastJob.perform_later self }

end