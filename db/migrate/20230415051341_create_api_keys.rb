class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token

      t.timestamps
    end
    add_index :api_keys, :access_token
  end
end
