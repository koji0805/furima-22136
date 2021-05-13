class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :order, null: false,  foreign_key: true
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture_id,   null: false
      t.string :address1,   null: false
      t.string :address2,   null: false
      t.string :telephone,   null: false
      t.string :building,  default: ""
      t.references :user,  null: false,  foreign_key: true

      t.timestamps
    end
  end
end
