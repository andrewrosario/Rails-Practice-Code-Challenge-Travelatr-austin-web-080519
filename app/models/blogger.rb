class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    
    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def featured_post
        feat = self.posts.order(likes: :desc).limit(1)
        return feat[0]
    end

    def total_likes
        self.posts.sum(:likes)
    end
end
