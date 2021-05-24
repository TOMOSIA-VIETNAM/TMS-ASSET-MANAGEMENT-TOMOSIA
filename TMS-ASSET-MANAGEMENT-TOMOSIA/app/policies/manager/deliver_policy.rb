class Manager::DeliverPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role == "manager"
        scope.all
      end
    end
  end

  def new?
    user.manager?
  end

  def index?
    user.manager?
  end

  def update?
    user.manager?
  end

  def create?
    user.manager?
  end

  def destroy?
    user.manager?
  end

  def scope
    Pundit.policy_scope!(user, [:manager,record.class])
  end

  def permitted_attributes
    if user.manager?
      [:status, :reason, :date_deliver]
    end
  end
end
