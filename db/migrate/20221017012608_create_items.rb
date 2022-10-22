class CreateItems < ActiveRecord::Migration[6.0]
  
  def change
    create_table :items do |t|
      t.references :user,               null: false, foreign_key:true
      t.string     :item_name,          null: false
      t.text       :item_description,   null: false
      t.integer    :item_category_id,   null: false
      t.integer    :item_status_id,     null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :delivery_days_id,   null: false
      t.integer    :price,              null: false

      t.timestamps
    end
  end
end
