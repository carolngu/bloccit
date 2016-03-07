require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

unique_post = Post.find_or_create_by!(
  title: "Moon and Rain",
  body: "Moon is seen even when it rains."
)

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by!(
  post: unique_post,
  body: "Can only see the moon if it's not raining too hard"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
