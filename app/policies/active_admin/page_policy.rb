class ActiveAdmin::PagePolicy < ApplicationPolicy
  def index?
    false
  end

  def show?
    case record.name
    when 'Dashboard'
      true
    else
      false
    end
  end
end
