
class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      byebug
      if user.role == "admin"
        scope.all
      else
        scope.where(:published => true)
      end
    end

    def index?
      true
    end

    def show?
      true
    end

    def update?
      user.admin? or not post.published?
    end
  end
end
