class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :nome
      t.integer :quantidade
      t.float :valor

      t.timestamps
    end
  end
end
