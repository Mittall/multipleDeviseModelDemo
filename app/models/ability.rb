class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.customer?
      can :read, Product
    elsif user.member?
      can :read, Product
      can :create, Product
      can :update, Product
    else
      can :read, Product
    end

  end

  def initialize(admin)
    admin = Admin.new
    if admin.author?
      can :create, Author
      can :update, Author
      puts '---------------'
      puts 'author'
      puts '---------------'
    else
      can :read, :all
    end
  end

end
