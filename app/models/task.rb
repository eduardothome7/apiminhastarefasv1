class Task < ApplicationRecord
  belongs_to :category
  belongs_to :status
  belongs_to :project
  belongs_to :user, :polymorphic => true
  has_many :historics
  before_create :set_status
  scope :opened, -> { where(status_id: Status.find_by(name:'aberta').id) }
  scope :closed, -> { where(status_id: Status.find_by(name:'entregue').id) }
  
  def playing?
  	return historics.any? ? historics.last.play : false
  end

  def set_status
    status_id = Status.where(name: 'aberta').id
  end

  def change
  	if status.name == "aberta"
	   Historic.create(task_id: id, play: historics.any? ? !historics.last.play : true)
  	else 
  	  return false	  		
  	end
  end

end
