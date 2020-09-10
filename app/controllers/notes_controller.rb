# frozen_string_literal: true

class NotesController < ApplicationController
  def create
    note = Note.create(title: params[:title], label: params[:label], content: params[:note], pinned: params[:pinned], user_id: params[:user_id])
    render json: note
    end

  def update
    note = Note.find_by(id: params[:id])
    note.update(pinned: params[:pinned])

    render json: note
    end

  def destroy
    note = Note.find_by(id: params[:id])
    note.destroy

    render json: note
    end
end
