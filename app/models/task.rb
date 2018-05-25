class Task < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :status, optional: true
  belongs_to :project, optional: true
  belongs_to :user, optional: true
  has_many :historics
  # validates :user_id, presence: true
  validates :title, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :project_id, presence: true
  validates :estimate_min, presence: true
  before_create :set_status
  before_create :set_user
  scope :opened, -> { where(status_id: Status.find_by(name:'aberta').id) }
  scope :closed, -> { where(status_id: Status.find_by(name:'entregue').id) }
  
  def playing?
  	return historics.any? ? historics.last.play : false
  end

  def set_status
    status_id = Status.find_by(name:'aberta').id
  end

  def change
  	if status.name == "aberta"
	   Historic.create(task_id: id, play: historics.any? ? !historics.last.play : true)
  	else 
  	  return false	  		
  	end
  end

  def get_prev_play(history)
    history = historics.where('id < ? AND play = ?', history.id, true).last
    return history
  end

  def worked_min
    min = 0.0
    if historics.any?
      # retorna tempo total já trabalhado
      historics.order('created_at asc').each do |history|   
        prev = get_prev_play(history)
        if prev.present?  
          time_diff  = history.created_at - prev.created_at
          range      = (time_diff / 1.minute).round
          min        = min + range
        end        
      end    
      if historics.last.play? 
        # time_diff  = DateTime.now - historics.last.created_at
        # range = (time_diff / 1.minute).round 
        # min = min + range 
      end
    end
    
    return min.round(2)
  
  end

  def codeId
    code = (id + 1000) * 47
    return "##{code}"
  end

  def set_user
    user_id = User.first.id
  end

  def percent 
    return (total_minutes.to_f / effort_min.to_f) * 100.0 
  end

end
