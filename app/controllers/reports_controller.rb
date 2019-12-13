# frozen_string_literal: true

class ReportsController < ApplicationController
  def index
    @reports = Report.all.recent_reports
  end

  def show
    @report = find_report
  end

  def new
    @report = current_user.reports.build
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to @report, notice: t(".success")
    else
      render :new
    end
  end

  def edit
    @report = find_report
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to @report, notice: t(".success")
    else
      render :edit
    end
  end

  def destroy
    @report = find_report
    @report.destroy
    redirect_to reports_url, notice: t(".success")
  end

  private
    def find_report
      Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :body)
    end
end
