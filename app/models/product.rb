class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, presence: true, length: {minimum: 1}
  validates :price, presence: true, numericality: true, :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
  validates :quantity, presence: true, length: {minimum: 1}, numericality: { only_integer: true }
  validates :description, presence: true

  has_attached_file :avatar, :styles => {
    :medium => "250x250>",
    :thumb => "100x100>"
    },
    :default_url => "missing_:style.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search_by_name_or_description(string)
    where("name LIKE ? OR description LIKE ?", "%#{string}%", "%#{string}%")
  end

private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
