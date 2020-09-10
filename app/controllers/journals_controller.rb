# frozen_string_literal: true

class JournalsController < ApplicationController
  def user_journals
    user = User.find(params[:id])

    render json: user.journals
  end

  def update
    journal = Journal.find_by(id: params[:id])
    journal.update(title: params[:title], content: params[:content], unformatted: params[:unformatted])

    render json: journal
    end

  def create
    journal = Journal.create(title: params[:title], content: params[:content], user_id: params[:user_id], unformatted: params[:unformatted])
    render json: journal
  end

  def destroy
    note = Journal.find_by(id: params[:id])
    note.destroy

    render json: note
    end

  def index
    @journals = Journal.where(user_id: 1) # creates an anonymous scope
    if params[:sort].length>0
      @journals = (@journals.order("#{params[:sort]} #{params[:order]}") if params[:sort].present? && params[:order].present?)
    end
    @journals = @journals.filter_by_phrase(params[:phrase]) if params[:phrase].present?
    render json: @journals.limit(12).offset(params[:page].to_i * 12)
  end
end
