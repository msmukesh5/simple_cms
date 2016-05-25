class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :password
    	t.string :epassword

    end
  end
end
