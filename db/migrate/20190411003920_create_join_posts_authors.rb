class CreateJoinPostsAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :join_posts_authors do |t|
      t.string :posts
      t.string :authors
    end
  end
end
