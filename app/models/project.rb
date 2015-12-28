class Project < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :image, presence: true, allow_blank: false
  validates :zip, presence: true, allow_blank: false

  acts_as_votable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_attached_file :zip
  validates_attachment_content_type :zip, content_type: ['application/zip', 'application/x-zip']


end
