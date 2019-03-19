# frozen_string_literal: true
class Api::UsersController < ApplicationController
  def sign_in
    @response, @user, @object_key = User.sign_in(params)
  end
end