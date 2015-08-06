class AddRoleRefToAdmins < ActiveRecord::Migration
  def change
    add_reference :admins, :role, polymorphic: true, index: true
  end
end

