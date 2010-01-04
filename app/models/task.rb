class Task < ActiveRecord::Base
  attr_accessor :fail
  belongs_to :project

  before_save :cause_before_save_problems
  after_save :cause_after_save_problems
  validate :cause_validation_problems

  def cause_validation_problems
    errors.add(:fail, 'in validation') if fail == :in_validation
  end

  def cause_before_save_problems
    return false if fail == :before_save
  end

  def cause_after_save_problems
    raise ActiveRecord::Rollback if fail == :after_save
  end
end
