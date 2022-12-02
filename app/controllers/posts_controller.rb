class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = Post.where(shop_id: params[:shop_id])
    @shop = Shop.find_by(id: params[:shop_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      shop_id: params[:shop_id],
      rate: params[:rate],
      is_recommendable: params[:is_recommendable]
    )

    if @post.save
      flash[:notice] = '投稿を作成しました'
      redirect_to shop_path(shop_id: params[:shop_id])
    else
      render new_comment_path(shop_id: params[:shop_id])
    end
  end

  def edit
    @post = Post.find_by(id: params[:post_id])
    @shop = Shop.find_by(id: params[:shop_id])
  end

  def update
    @post = Post.find_by(id: params[:post_id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = '投稿を編集しました'
      redirect_to shop_posts_path(shop_id: params[:shop_id])
    else
      render edit_shop_post_path(shop_id: params[:shop_id], post_id: params[:post_id])
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    return unless @post.destroy

    flash[:notice] = '投稿を削除しました'
    redirect_to shop_posts_path(shop_id: params[:shop_id])
  end

  def top
    @shops = Shop.order(updated_at: :desc).limit(3)
    @posts = Post.order(updated_at: :desc).limit(3)
  end
end
