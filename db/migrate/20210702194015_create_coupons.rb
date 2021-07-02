class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :product_name
      t.date :expiration_date
      t.decimal :value
      t.integer :user_id
      t.integer :store_id, null: true

      t.timestamps
    end
  end
end
