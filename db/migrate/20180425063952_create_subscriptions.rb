class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :billing_plan, foreign_key: true
      t.string :type
      t.string :state
      t.datetime :start_date
      t.datetime :end_date
      t.references :subscribeble, polymorphic: true

      t.timestamps
    end
  end
end
