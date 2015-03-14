class ContenusController < ApplicationController
	
	def create
		@article = Article.find(params[:article_id])
		if params[:commit] == 'Ajouter et continuer'
			@contenu = @article.contenus.create(contenu_params)
			redirect_to edit_article_path(@article)
		elsif params[:commit] == 'Ajouter et terminer'
			@contenu = @article.contenus.create(contenu_params)
			redirect_to article_path(@article)
		elsif params[:commit] == 'Terminer'
			redirect_to article_path(@article)
		end    
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@contenu = @article.contenus.find(params[:id])
		@contenu.destroy
		redirect_to edit_article_path(@article)
	end
		
	private
		def contenu_params
			params.require(:contenu).permit(:texte, :type)
		end
end
