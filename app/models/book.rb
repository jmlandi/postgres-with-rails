class Book < ApplicationRecord
  belongs_to :bookcase
  belongs_to :author
  validate :is_bookcase_on_limit 

  def is_bookcase_on_limit()
    if (self.bookcase.books.count >= self.bookcase.limit)
      errors.add(:base, "The bookcase is full.")
    end
  end

end
