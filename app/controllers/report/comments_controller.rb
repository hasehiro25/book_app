# frozen_string_literal: true

class Report::CommentsController < ::CommentsController
  def create
    @commentable = find_report
    super
  end

  private
    def find_report
      Report.find(params[:report_id])
    end
end
