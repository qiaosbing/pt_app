class CreateUserDescs < ActiveRecord::Migration[5.2]
  def change
    create_table :user_descs do |t|
      t.string :user_id
      t.string :user_name
      t.string :phone
      t.string :mailbox
      t.string :units
      t.string :remark

      t.timestamps
    end
  end
end
