# frozen_string_literal: true

class ToDosController < ApplicationController
  def update
    todo = ToDo.find_by(id: params[:id])
    todo.update(completed: params[:completed])

    render json: todo
  end

  def create
    todo = ToDo.create(content: params[:content], completed: false, user_id: params[:user_id])
    render json: todo
  end

  def destroy
    todo = ToDo.find_by(id: params[:id])
    todo.destroy

    render json: todo
  end
end
