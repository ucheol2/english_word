class User < ActiveRecord::Base
  
  has_many :vocas
  
  def get_segregation(day)
    if day == 0
      vocas = self.vocas
    else
      vocas = self.vocas.where(day: day)
    end
    return [vocas.where(step: 0),vocas.where(step: 1),vocas.where(step: 2),vocas.where(step: 3),vocas.where(step: 4),vocas.where(step: 5),vocas.where(step: 6)]
  end
  
  def reset_all(day)
    if day == 0
      vocas = self.vocas
    else
      vocas = self.vocas.where(day: day)
    end
    vocas.each do |item|
      item.update(step: 1)
    end
  end
  
  def reset_wrongs(day)
    if day == 0
      vocas = self.vocas
    else
      vocas = self.vocas.where(day: day)
    end
    vocas.where(step: 0).each do |item|
      item.update(step: 1)
    end
  end
  
  def set_history(step)
    if step == 1
      self.update(step1: Time.now)
    elsif step == 2
      self.update(step2: Time.now)
    elsif step == 3
      self.update(step3: Time.now)
    elsif step == 4
      self.update(step4: Time.now)
    elsif step == 5
      self.update(step5: Time.now)
    end
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
