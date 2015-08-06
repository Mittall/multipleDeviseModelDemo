class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #ROLES = [['Customer', 'customer'],['Member', 'member']]

  belongs_to :role

  before_save :assign_role

  def assign_role
    self.role.name = Role.find_by name: "customer" if self.role.name.nil?
  end

  def customer?
    self.role.name == "customer"
  end

  def member?
    self.role.name == "member"
  end

end
