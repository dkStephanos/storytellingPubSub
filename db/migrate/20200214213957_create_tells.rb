class CreateTells < ActiveRecord::Migration[6.0]
  def change
    create_table :tells do |t|
      t.string :title
      t.string :tellerName
      t.string :keyword

      t.timestamps
    end
  end
end
