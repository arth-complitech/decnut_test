class Step < ActiveRecord::Base
  belongs_to :pathway
  has_many :assignments_steps, :dependent => :destroy
  has_many :assignments, :through => :assignments_steps
  has_attached_file :url_link, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :url_link, content_type: /\Aimage\/.*\Z/
end
