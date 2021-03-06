class User < ApplicationRecord
    before_save { self.email.downcase! }
    def feed_books
    Book.where(user_id: [self.id])
    end
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
   
   has_many :books
end