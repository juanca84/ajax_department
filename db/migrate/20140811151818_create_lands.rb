class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.references :department
      t.references :municipality
      t.string :unit
      t.references :register

      t.timestamps
    end
    add_index :lands, :department_id
    add_index :lands, :municipality_id
    add_index :lands, :register_id
  end
end
