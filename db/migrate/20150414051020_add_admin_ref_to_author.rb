class AddAdminRefToAuthor < ActiveRecord::Migration
  def change
    add_reference :authors, :admin, index: true
  end
end
