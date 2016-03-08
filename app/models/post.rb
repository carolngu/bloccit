class Post < ActiveRecord::Base
  has_many :comments

  def self.spamify
    posts = Post.all

    posts.each_with_index do |post,index|
      if index % 5 == 0
        post.title = "SPAM"
        post.save!
      end
    end
  end
end
