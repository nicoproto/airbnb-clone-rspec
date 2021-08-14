class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user != nil
  end

  def create?
    user != nil
  end

  def show?
    user != nil
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
