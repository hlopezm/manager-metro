class Project < ActiveRecord::Base

  belongs_to :category
  belongs_to :portfolio
  belongs_to :executor
  belongs_to :unit
  validates_presence_of :name
  mount_uploader :image, ImageUploader
  validate :image_size


  def total_price
    @items.inject(0) { | sum, item | sum + item.total_price }
  end

  private
  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "Imagen debe ser menor a 5MB")
    end
  end

end
