class Task < ApplicationRecord
  belongs_to :category
  belongs_to :status
  belongs_to :project
  has_many :historics

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
