class NgoPolicy < ApplicationPolicy
  def show?
    true
  end

  def follow?
    user
  end

  def unfollow?
    user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
