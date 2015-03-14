class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		if params[:commit] == 'Poster'
		  @comment = @article.comments.create(commentaire_params)
		  redirect_to article_path(@article)
		elsif params[:commit] == 'Annuler'
		  redirect_to articles_path
		end
	end
	
	private
		def commentaire_params
			params.require(:comment).permit(:commentateur, :commentaire)
		end

end
