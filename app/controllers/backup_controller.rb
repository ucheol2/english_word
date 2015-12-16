class BackupController < ApplicationController
  def index
    @vocas = current_user.vocas
  end
end
