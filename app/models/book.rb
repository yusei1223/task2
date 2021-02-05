class Book < ApplicationRecord

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

def favorite_by?(book)
    favorites.exists?(book_id: book.id)
end

end