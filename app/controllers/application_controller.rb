class ApplicationController < ActionController::Base
	layout 'application'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_owner
    Owner.find(session[:id]) if session[:id]
  end
  def current_sitter
    Sitter.find(session[:sitter_id]) if session[:sitter_id]
  end
  def require_correct_owner
    owner = Owner.find(params[:id])
    redirect_to "/owners/#{current_owner.id}/show" if current_owner != owner
  end
  def require_correct_sitter
    sitter = Sitter.find(params[:sitter_id])
    redirect_to "/sitter/#{current_sitter.id}" if current_sitter != sitter
  end

  def require_login
    if session[:sitter_id] == nil && session[:id]==nil
      redirect_to '/login'
    end
  end

  helper_method :current_owner, :current_sitter
end
