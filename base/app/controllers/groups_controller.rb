class GroupsController < ApplicationController
  include SocialStream::Controllers::Subjects
  include SocialStream::Controllers::Authorship

  before_filter :authenticate_user!, :except => [ :index, :show ]

  load_and_authorize_resource

  respond_to :html, :js

  def index
    raise ActiveRecord::RecordNotFound
  end

  def create
    create! do |success, failure|
      success.html {
        self.current_subject = resource
        redirect_to :home
      }
    end
  end

  def destroy
    destroy! do |success, failure|
      success.html {
        self.current_subject = current_user
        redirect_to :home
      }
    end
  end
end
