class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.role == 'admin'
  end

  def show?
    user.role == 'admin'
  end

  def create?
    user.role == 'admin'
  end

  def new?
    user.role == 'admin'
  end

  def update?
    user.role == 'admin'
  end

  def edit?
    user.role == 'admin'
  end

  def destroy?
    user.role == 'admin'
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  rescue Pundit::NotDefinedError
    Scope.new(user, record.class).resolve
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
