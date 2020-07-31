require 'rails_helper'

describe Product do
  describe "#create" do

    let(:user) { create(:user) }

    context '登録されない' do

      before do
        @product = build(:product, name: nil, explanation: nil, category_id: 1, status_id: 1, 
                        delivery_fee_id: 1, shipping_origin_id: 1, until_shipping_id: 1, price: nil)
      end

      it '商品名が空だと登録されない' do
        @product.valid?
        expect(@product.errors[:name]).to include("を入力してください")
      end

      it '商品の説明が空だと登録されない' do
        @product.valid?
        expect(@product.errors[:explanation]).to include("を入力してください")
      end

      it 'category_idが1だと登録されない' do
        @product.valid?
        expect(@product.errors[:category_id]).to include("を選んでください")
      end

      it 'status_idが1だと登録されない' do
        @product.valid?
        expect(@product.errors[:status_id]).to include("を選んでください")
      end

      it 'delivery_fee_idが1だと登録されない' do
        @product.valid?
        expect(@product.errors[:delivery_fee_id]).to include("を選んでください")
      end

      it 'shipping_origin_idが1だと登録されない' do
        @product.valid?
        expect(@product.errors[:shipping_origin_id]).to include("を選んでください")
      end

      it 'until_shipping_idが1だと登録されない' do
        @product.valid?
        expect(@product.errors[:until_shipping_id]).to include("を選んでください")
      end

      it '価格が空だと登録されない' do
        @product.valid?
        expect(@product.errors[:price]).to include("を入力してください")
      end

      it '価格が299未満だと登録されない' do
        product = build(:product, price: "299")
        product.valid?
        expect(product.errors[:price]).to include("¥300から¥9,999,999の範囲で入力してください")
      end  

      it '価格が10,000,000以上だと登録されない' do
        product = build(:product, price: "10000000")
        product.valid?
        expect(product.errors[:price]).to include("¥300から¥9,999,999の範囲で入力してください")
      end
    end

    context "登録される" do

      it '価格が300以上だと登録される' do
        product = build(:product, user:user, price: "300")
        expect(product).to be_valid
      end
  
      it '価格が9,999,999以下だと登録される' do
        product = build(:product, user:user, price: "9999999")
        expect(product).to be_valid
      end
    end  
  end
end
