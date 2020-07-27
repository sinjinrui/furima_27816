require 'rails_helper'

describe User do
  describe '#create' do

    before do
      @user = build( :user, {nickname: "", email: "", password: "", first_name: "", last_name: "", first_name_kana: "", last_name_kana: "", birthday: ""} )
    end

    it "ニックネームが空だと登録されません" do
      @user.valid?
      expect(@user.errors[:nickname]).to include("が入力されていません。")
    end

    it "メールアドレスが空だと登録されません" do
      @user.valid?
      expect(@user.errors[:email]).to include("が入力されていません。")
    end

    it "メールアドレスに@マークが無いと登録されません" do
      @user = build(:user, email: "test.gmai.com")
      @user.valid?
      expect(@user.errors[:email]).to include("は有効でありません。")
    end

    it "重複したメールアドレスが存在する場合登録できません" do
      @user = create(:user)
      @another_user = build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "パスワードが空だと登録されません" do
      @user.valid?
      expect(@user.errors[:password]).to include("が入力されていません。")
    end

    it "パスワードと確認用パスワードが一致しないと登録されません" do
      @user = build(:user, password: "abc123", password_confirmation: "abc456")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    it "パスワードが6文字未満だと登録されません" do
      @user = build(:user, password: "abc12", password_confirmation: "abc12")
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end

    it "パスワードが英字だけだと登録されません" do
      @user = build(:user, password: "abcdef", password_confirmation: "abcdef")
      @user.valid?
      expect(@user.errors[:password]).to include("は英字と数字の両方を含めて、6文字以上で設定してください。")
    end

    it "パスワードが数字だけだと登録されません" do
      @user = build(:user, password: "123456", password_confirmation: "123456")
      @user.valid?
      expect(@user.errors[:password]).to include("は英字と数字の両方を含めて、6文字以上で設定してください。")
    end

    it "パスワードが6文字以上で英字数字混合だと登録されます" do
      @user = build(:user, password: "abc123", password_confirmation: "abc123")
      expect(@user).to be_valid
    end

    it "苗字が空だと登録されません" do
      @user.valid?
      expect(@user.errors[:first_name]).to include("が入力されていません。")
    end

    it "苗字に半角が含まれると登録されません" do
      @user = build(:user, first_name: "yama田")
      @user.valid?
      expect(@user.errors[:first_name]).to include("は全角で入力してください。")
    end

    it "名前が空だと登録されません" do
      @user.valid?
      expect(@user.errors[:last_name]).to include("が入力されていません。")
    end
  
    it "名前に半角が含まれると登録されません" do
      @user = build(:user, last_name: "ta郎")
      @user.valid?
      expect(@user.errors[:last_name]).to include("は全角で入力してください。")
    end

    it "苗字(カナ)が空だと登録されません" do
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("が入力されていません。")
    end

    it "苗字(カナ)が全角カタカナでないと登録されません" do
      @user = build(:user, first_name_kana: "やまだ")
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("は全角カタカナで入力してください。")
    end

    it "名前(カナ)が空だと登録されません" do
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("が入力されていません。")
    end

    it "名前(カナ)が全角カタカナでないと登録されません" do
      @user = build(:user, last_name_kana: "たろう")
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include("は全角カタカナで入力してください。")
    end

    it "生年月日が空だと登録されません" do
      @user.valid?
      expect(@user.errors[:birthday]).to include("が入力されていません。")
    end
  end
end
