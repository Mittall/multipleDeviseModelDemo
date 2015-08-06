class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, :dependent => :destroy, :polymorphic => true
  
  def author?
    self.role == "Author"
    puts '==================='
    puts self.role
    puts '==================='
  end
end
