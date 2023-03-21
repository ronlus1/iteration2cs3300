class CreateAddcustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :addcustomers do |t|
      t.string :name
      t.string :lastname
      t.text :homeaddress
      t.date :dateofbirth

      t.timestamps
    end
  end
end
