class Comment < ActiveRecord::Base
  validates_presence_of :body, message: "Comment body can't be blank"

  belongs_to :topic
end
