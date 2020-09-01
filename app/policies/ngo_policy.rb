class NgoPolicy < ApplicationPolicy
  def like?
    user
  end

  def unlike?
    user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
