class Forum < ActiveRecord::Base
	validates_presence_of :name, message: "Forum name can't be blank"

	has_many :topics

	acts_as_taggable

  def to_param
    "#{id} #{name}".parameterize
  end
end
