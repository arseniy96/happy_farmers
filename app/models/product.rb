class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :icon, styles: { medium: "300x300>", thumb: "150x150>", small: "80x80>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/

end
