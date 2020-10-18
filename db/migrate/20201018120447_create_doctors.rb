class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.bigint :contact_no
      t.string :address
      t.integer :salary
      t.references :department, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
