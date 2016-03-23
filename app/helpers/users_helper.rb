module UsersHelper
# checks to see if the user has any posts
  def has_posts(user)
    user.posts.count > 0
  end

  def has_comments(user)
    user.comments.count > 0
  end

  def has_favorites(user)
    user.favorites.count > 0
  end
end
