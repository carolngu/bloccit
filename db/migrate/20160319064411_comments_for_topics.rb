class CommentsForTopics < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.references :topic, index: true, foreign_key: true
    end
  end
end
