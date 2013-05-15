class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text, :url
      t.references :category
    end
  end
end
