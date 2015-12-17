module Contexts
  module Users
    # ======= Context for Users ==========
    def create_users
      @user_0 = FactoryGirl.create(:user, email: "user_0@gmail.com")
      @user_1 = FactoryGirl.create(:user, email: "user_1@gmail.com")
      @user_2 = FactoryGirl.create(:user, email: "user_2@gmail.com")
      @user_3 = FactoryGirl.create(:user, email: "user_3@gmail.com")
      @user_4 = FactoryGirl.create(:user, email: "user_4@gmail.com")
      @user_5 = FactoryGirl.create(:user, email: "user_5@gmail.com")
    end

    def destroy_users
      @user_0.delete
      @user_1.delete
      @user_2.delete
      @user_3.delete
      @user_4.delete
      @user_5.delete
    end
  end
end