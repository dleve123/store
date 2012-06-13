class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, :length => { :minimum => 4 }
  validates :image_url, format: {
    with:   %r{\.(gif|jpg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private

    # ensures that there are no line_items referenced to the about-to-be-destroyed produce
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line items present')
        return false
      end
    end

end
