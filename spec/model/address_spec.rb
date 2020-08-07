require 'rails_helper'

describe Address do
  describe "#create" do

    context "登録されない" do

      before do
        @address = build(:address, postal_code: nil, shipping_origin_id: nil, city: nil, house_number: nil, building_name: nil, tel: nil)
      end

      it '郵便番号が無いと登録されない' do
        @address.valid?
        expect(@address.errors[:postal_code]).to include("を入力してください", "は不正な値です")
      end

      it '都道府県が無いと登録されない' do
        @address.valid?
        expect(@address.errors[:shipping_origin_id]).to include("を入力してください", "は数値で入力してください")
      end

      it '市区町村が無いと登録されない' do
        @address.valid?
        expect(@address.errors[:city]).to include("を入力してください")
      end

      it '番地が無いと登録されない' do
        @address.valid?
        expect(@address.errors[:house_number]).to include("を入力してください")
      end

      it '電話番号が無いと登録されない' do
        @address.valid?
        expect(@address.errors[:tel]).to include("を入力してください")
      end

      it '郵便番号にハイフンが無いと登録されない' do
        address = build(:address, postal_code: '1801122')
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end

      it '電話番号にハイフンがあると登録されない' do
        address = build(:address, tel: '090-1111-2222')
        address.valid?
        expect(address.errors[:tel]).to include("は不正な値です")
      end

      it '電話番号が12桁以上だと登録されない' do
        address = build(:address, tel: '090111122223')
        address.valid?
        expect(address.errors[:tel]).to include("は不正な値です") #バリデーション確認！
      end
      
    end

    context "登録される" do
      it '電話番号が11桁以下なら登録される' do
        address = build(:address, tel: '09011112222')
        expect(address).to be_valid
      end

      it '郵便番号、都道府県、市区町村、番地、電話番号があれば登録される' do
        address = build(:address, building_name: nil)
        expect(address).to be_valid
      end
      
    end
    
    
    
  end
  
end