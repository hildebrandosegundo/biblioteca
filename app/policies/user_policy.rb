class UserPolicy < ApplicationPolicy
  def create?
    user.admin?
  end
  def index?
    user.admin?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
