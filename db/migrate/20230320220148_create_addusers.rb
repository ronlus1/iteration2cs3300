class CreateAddusers < ActiveRecord::Migration[6.1]
  def change
    create_table :addusers do |t|
      t.string :name
      t.string :lastname
      t.text :homeaddress
      t.integer :dateofbirth

      t.timestamps
    end
  end
end
