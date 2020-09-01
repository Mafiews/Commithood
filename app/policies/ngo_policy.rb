class NgoPolicy < ApplicationPolicy
  def show?
    true
  end

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
