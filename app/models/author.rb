class Author < ActiveRecord::Base
  has_one :admin, as: :role, dependent: :nullify

  accepts_nested_attributes_for :admin

  #def admin_role(role)
    #puts role
    #if role == "Author"
      #return role
    #end
  #end

end
