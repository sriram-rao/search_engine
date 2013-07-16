#the class name must be the camelcased version of the filename
class CreateAuthenticationTable <  ActiveRecord::Migration
  def up
    create_table :authentication do |t|
      t.string :server_name
      t.string :server_address
      t.string :authentication_token
    end
  end
 
  def down
    drop_table :authentication
  end
end