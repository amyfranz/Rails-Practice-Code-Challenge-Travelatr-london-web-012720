class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :post

    validates :name, uniqueness: true
    validates :age,  numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def total_likes
        self.posts.sum(&:likes)
    end

    def best_post
        self.posts.max_by { |x| x.likes }
    end
end