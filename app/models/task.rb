class Task < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :status, optional: true
  belongs_to :project, optional: true
  belongs_to :user, :polymorphic => true
  has_many :historics
  scope :opened, -> { where(status_id: Status.find_by(name:'aberta').id) }
  scope :closed, -> { where(status_id: Status.find_by(name:'entregue').id) }
  
  def playing?
  	return historics.any? ? historics.last.play : false
  end

  def change
  	if status.name == "aberta"
	   Historic.create(task_id: id, play: historics.any? ? !historics.last.play : true)
  	else 
  	  return false	  		
  	end
  end

end
