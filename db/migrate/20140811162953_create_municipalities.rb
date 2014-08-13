class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :name
      t.references :province

      t.timestamps
    end
    add_index :municipalities, :province_id
  end
end
