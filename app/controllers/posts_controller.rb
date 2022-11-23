class PostsController < ApplicationController
  before_action :authenticate_user
  
  def index
      @posts = Post.where(shop_id: params[:shop_id])
  end

  def show
    @post=Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end
  
  def new
    @post = Post.new
  end

  def create
    @post=Post.new(
      content: params[:content],
      user_id: @current_user.id,
      shop_id: params[:shop_id],
      rate: params[:rate],
      is_recommendable: params[:is_recommendable]
      )

    if @post.save
      flash[:notice] = "投稿を作成しました"
    redirect_to shop_path(shop_id: params[:shop_id])
    else
      render new_comment_path(shop_id: params[:shop_id])
    end
  end

  def edit 
    @post= Post.find_by(id: params[:id]) 
  end

  def update
    @post= Post.find_by(id: params[:id])
    @post.content= params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post=Post.find_by(id:params[:id]) 
    if@post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end


  def top
  end

end
