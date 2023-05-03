class Public::UsersController < ApplicationController


  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    # flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


    # enum is_active: {Available: true, Invalid: false}
    # #有効会員はtrue、退会済み会員はfalse

     def active_for_authentication?
         super && (self.is_active === "Available")
     end
    # #is_activeが有効の場合は有効会員(ログイン可能)


#上↑いらない？


def check
    @user = User.find(params[:id])
    #ユーザーの情報を見つける
end

def withdrawl
    @user = User.find(current_user.id)
    #現在ログインしているユーザーを@userに格納
    @user.update(is_active: "Invalid")
    #updateで登録情報をInvalidに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
end

private

def user_params
    params.require(:user).permit(:is_active)
end

end

