class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.bigint :contact
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
