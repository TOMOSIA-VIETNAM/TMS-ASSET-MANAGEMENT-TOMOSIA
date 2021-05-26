class Manager::DeliverPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role == "manager" || user.admin?
        scope.all
      end
    end
  end

  def new?
    user.manager? || user.admin?
  end

  def index?
    user.manager? || user.admin?
  end

  def update?
    user.manager? || user.admin?
  end

  def create?
    user.manager? || user.admin?
  end

  def destroy?
    user.manager? || user.admin?
  end

  def scope
    Pundit.policy_scope!(user, [:manager,record.class])
  end

  def permitted_attributes
    if user.manager? || user.admin?
      [:status, :reason, :date_deliver]
    end
  end
end
