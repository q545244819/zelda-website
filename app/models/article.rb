class Article < ApplicationRecord
  belongs_to :category

  self.per_page = 9
end
