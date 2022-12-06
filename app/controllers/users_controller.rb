class UsersController < ApplicationController
  before_action :authenticate_user, { only: [:index, :show, :edit, :update] }
  before_action :forbid_login_user, { only: [:new, :create, :login_form, :login] }
  before_action :ensure_correct_user, { only: [:edit, :update] }

  def index
    @post = Post.find(params[:id])
    @users = @post.content

    favorites = Favorite.where(post_id: @post.id).pluck(:user_id)
    @favorite_post = Post.find(favorites)
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.where(user_id: @user.id)
    @shop = Shop.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to("/users/#{@user.id}")
    else
      render('users/new')
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = 'ユーザー情報を編集しました'
      redirect_to("/users/#{@user.id}")
    else
      render('users/edit')
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to user_path(id: @user.id)
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('users/login_form')
    end
  end

  def logout 
    session[:user_id] = nil 
    flash[:notice] = 'ログアウトしました' 
    redirect_to('posts/top', allow_other_host: true) 
  end

  def ensure_correct_user
    return unless @current_user.id != params[:id].to_i

    flash[:notice] = '権限がありません'
    redirect_to('users/login_form')
  end
end
