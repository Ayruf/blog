class ArticlesController < ApplicationController

		http_basic_authenticate_with name: "lelendyl", password: "fleurdelys",
	except: [:index, :show]
		
		def index
			@article = Article.all
		end
		
		def show
			@article = Article.find(params[:id])
		end
	
		def new
			@article = Article.new
		end
		
		def edit
			@article = Article.find(params[:id])
		end
		
		def create
			@article = Article.new(article_params)
			
			if params[:commit] == 'Continuer' 
				if @article.save
					redirect_to edit_article_path(@article)
				else 
					render 'new'
				end
			elsif params[:commit] == 'Annuler la création'
				redirect_to articles_path
			end
		end
		
		def update
			@article = Article.find(params[:id])
			
			if @article.update(article_params)
				redirect_to @article
			
			else
				render 'edit'
			end			
		end
				
		def destroy
			@article = Article.find(params[:id])
			@article.destroy
			
			redirect_to articles_path
		end
		
		private
			def article_params
				params.require(:article).permit(:titre, :corps)
			end
		
end
