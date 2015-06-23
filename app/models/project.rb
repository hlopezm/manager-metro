class Project < ActiveRecord::Base

  belongs_to :category
  belongs_to :portfolio
  belongs_to :executor
  belongs_to :unit
  validates_presence_of :name
  has_attached_file :image, :styles => {
                      thumb: '100x100>',
                      square: '200x200#',
                      medium: '300x300>'
                    },
                    :url => "/assets/projects/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/projects/:id/:style/:basename.:extension"
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def total_price
    @items.inject(0) { | sum, item | sum + item.total_price }
  end

end
