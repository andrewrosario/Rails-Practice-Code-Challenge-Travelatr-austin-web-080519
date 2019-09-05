class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def my_posts
        self.posts.order(created_at: :desc).limit(5)
    end

    def featured_post
        # feat = Post.order(likes: :desc).where("destination_id = #{self.id}").limit(1)
        # byebug
        feat = self.posts.order(likes: :desc).limit(1)
        return feat[0]
    end

    def average_age
        self.bloggers.average(:age)
    end
end
