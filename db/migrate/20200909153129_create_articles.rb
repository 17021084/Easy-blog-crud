class CreateArticles < ActiveRecord::Migration[6.0]
  # run if we call migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
