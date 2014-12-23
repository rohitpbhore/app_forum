class Topic < ActiveRecord::Base
	validates_presence_of :title, message: "Title can't be blank"

  belongs_to :forum
  has_many :comments

  acts_as_taggable
  # acts_as_taggable_on :title

  def to_param
    "#{id} #{title}".parameterize
  end
end
