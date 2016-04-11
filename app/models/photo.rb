require 'carrierwave/orm/activerecord'

class Photo < ActiveRecord::Base
  belongs_to :post
  mount_uploader :photo, PhotoUploader

=begin
 before_create :generate_id

  def photo?
    content_type.start_with? 'image'
  end

  private

  def generate_id
    begin
      generated_id = rand(1..INTEGER)
    end until !Attach.exists?(generated_id)
    self.id = generated_id
  end
=end

end

