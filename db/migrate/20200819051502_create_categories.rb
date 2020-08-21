class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :description
      t.bigint :created_by

      t.timestamps
    end
  end
end
