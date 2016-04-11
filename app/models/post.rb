class Post < ActiveRecord::Base

belongs_to :user
has_many :photos
accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title,
  :presence => true, 
  :length => {:minimum => 1, :maximum => 254}

  validates :description,
    :presence => true,
    :length => {:minimum => 1, :maximum => 511}
 
  validates :phone,
    :length => {:minimum => 6, :maximum => 12},
    :allow_blank => true
  #  format: { with: /\A(?:\+?|\b)(?=.*?[1-9]|\s)[0-9()-|\s]+\Z/ }
                   
  validates :email,
    :allow_blank => true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :address,
    :length => {:minimum => 1, :maximum => 254},
    :allow_blank => true

  validates :url,
    :length => {:minimum => 1, :maximum => 254},
    :allow_blank => true,
    :format => URI::regexp(%w(http https))

end
