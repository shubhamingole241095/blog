class PostsController < ApplicationController

	# list all posts
 	def index
 		@posts = Post.all
 		@published = Post.published
 		@archived = Post.archived
 		@tags = Tag.includes(:posts)
 	end

 	# find posts record
 	def show
 		@post = Post.find(params[:id])
 	end

	# GET /published/posts
  def published
    @posts = Post.published
  end

  # GET /archived/posts
  def archived
    @posts = Post.archived
  end

  # GET /posts/tags/name
  def list_by_tag
    @tag = Tag.find_by_id(params[:id])
    @posts = @tag.posts
  end 
end
