class VocaController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @vocas = current_user.get_segregation(params[:day].to_i)
    @icons = ["looks_one", "looks_two", "looks_3", "looks_4"]
    @history = [current_user.step1, current_user.step2, current_user.step3, current_user.step4, current_user.step5]
  end
  
  def manage
    @voca = current_user.vocas
  end
  
  def create
    Voca.create(user: current_user, word: params[:letter], meaning: params[:meaning], step: 1, day: params[:day].to_i)
    
    redirect_to "/voca/manage/#{params[:day]}"
  end
  
  def delete_voca
    word = Voca.find(params[:id].to_i)
    word.destroy
    
    respond_to do |format|
      format.json { render json: current_user.vocas.reverse }
    end
  end
  
  def step_up
    word = Voca.find(params[:id].to_i)
    curr_step = word.step
    current_user.set_history(curr_step)
    word.update(step: curr_step+1)
    new_seg = current_user.get_segregation(params[:day].to_i)
    
    respond_to do |format|
      format. json { render json: [new_seg[curr_step],new_seg[curr_step+1]] }
    end
  end
  
  def step_down
    word = Voca.find(params[:id].to_i)
    curr_step = word.step
    current_user.set_history(curr_step)
    word.update(step: 0)
    new_seg = current_user.get_segregation(params[:day].to_i)
    
    respond_to do |format|
      format. json { render json: [new_seg[curr_step],new_seg[0]] }
    end
  end
  
  def reset_all
    current_user.reset_all(params[:id].to_i)
    redirect_to :back
  end
  
  def reset_wrongs
    current_user.reset_wrongs(params[:id].to_i)
    redirect_to :back
  end
  
end
