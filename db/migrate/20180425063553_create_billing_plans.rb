class CreateBillingPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :billing_plans do |t|
      t.string :plan_code
      t.string :plan_name
      t.decimal :plan_price, precision: 10, scale: 5
      t.string :plan_frequency
      t.string :type
      t.text :features

      t.timestamps
    end
  end
end
