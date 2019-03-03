class CreateVendas < ActiveRecord::Migration[5.2]
  def change
    create_table :vendas do |t|
      t.string :nome_cliente
      t.string :item_id

      t.timestamps
    end
    add_index :vendas, :item_id
  end
end
