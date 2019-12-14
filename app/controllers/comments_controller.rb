# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      redirect_to @commentable, notice: t("comments.create.success")
    else
      redirect_to @commentable, alert: t("comments.create.failed")
    end
  end

  def edit
    @comment = find_comment
    validate_authority
  end

  def update
    @comment = find_comment
    validate_authority
    if @comment.update(comment_params)
      redirect_to commentable, notice: t("comments.update.success")
    else
      redirect_to commentable, alert: t("comments.update.failed")
    end
  end

  def destroy
    @comment = find_comment
    validate_authority
    @comment.destroy
    redirect_to commentable,  notice: t("comments.destroy.success")
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user: current_user)
    end

    def commentable
      klass = @comment.commentable_type.constantize
      klass.find(@comment.commentable_id)
    end

    def find_comment
      Comment.find(params[:id])
    end

    def validate_authority
      @comment ||= find_comment
      return head :forbidden unless current_user == @comment.user
    end
end
