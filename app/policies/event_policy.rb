class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where('canceled_at is NULL')
    end
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
