class AssociateUsersWithArticles < ActiveRecord::Migration[5.2]
  def change
    change_table :articles do
      add_column :articles, :author_id, :integer
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
