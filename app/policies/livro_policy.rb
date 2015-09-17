class LivroPolicy < ApplicationPolicy
  def new?
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
