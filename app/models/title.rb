class Title < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :figure_titles
  has_many :figures, through: :figure_titles

end
