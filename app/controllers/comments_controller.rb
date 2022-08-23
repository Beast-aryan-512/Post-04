class CommentsController < ApplicationController

	def create
		@comment = Comment.create(comment_params)
		redirect_to blog_path(params[:comment][:blog_id])
	end

	private
	def comment_params
		params.require(:comment).permit(:id, :user_id, :blog_id, :body)
	end
end
