class EquipmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def my_equipment?
    true
  end

  def update?
    true
  end

  def count_status?
    true
  end
end
