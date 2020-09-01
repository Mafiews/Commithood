class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    update?
  end

  def show?
    true
  end

  def update?
    @record.user == @user || @user.admin
  end

  def destroy?
    @record.user == @user || @user.admin
  end

  def like?
    user
  end

  def unlike?
    user
  end

  def like_home?
    user
  end

  def unlike_home?
    user
  end
  
  def like_dashboard?
    user
  end

  def unlike_dashboard?
    user
  end
  
end
