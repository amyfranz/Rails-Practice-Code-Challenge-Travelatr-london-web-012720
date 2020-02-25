class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :post

    def best_post
        self.posts.max_by { |x| x.likes }
    end

    def average_age
        counting = self.posts.select{|post| post.blogger_id}.count
        posts_dest = self.posts.select{|post| post.blogger_id}.map{|post| post.blogger_id}
        sums = Blogger.select{|blog| posts_dest.include?(blog.id)}.sum{|blog| blog.age}
        sums/counting
    end
end
