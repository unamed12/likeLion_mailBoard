class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

    t.string "address"
    t.string "title"
    t.string "content"

      t.timestamps null: false
    end
  end
end
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

    t.string "address"
    t.string "title"
    t.string "content"

      t.timestamps null: false
    end
  end
end
