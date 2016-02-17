class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
		versions = @category.versions
		versions.to_a.select! do |version|
			version == version.article.published_version
		end
		@articles = @category.articles
	end
end