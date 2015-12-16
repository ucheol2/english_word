class BackupController < ApplicationController
  def index
    @words = current_user.vocas
  end
end
