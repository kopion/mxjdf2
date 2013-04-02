class Post < ActiveRecord::Base
  attr_accessible :text, :title
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :text, :presence => true
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
                                   
end
