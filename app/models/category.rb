class Category < ActiveRecord::Base
  has_many :posts
  # Remember to create a migration!
  validates :category, uniqueness: true

  def self.newish(cat)
    element =  Category.where('category = ?', cat)[0]
    if element
      element.id
    else
      new_cat = Category.create(category: cat)
      new_cat.id
    end
  end
end
