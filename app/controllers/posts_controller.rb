class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :content))
    if @post.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :posts
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :content))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end

  def destroy
  end
end
