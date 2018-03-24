require 'rails_helper'

RSpec.describe CartItem, type: :model do

  describe '.sum_price' do
    context 'カートに商品が複数入っている時' do
      it '商品の合計金額を返すこと' do
        FactoryBot.create_list(:item, 3)
        cart = FactoryBot.create(:cart) do |c|
          3.times do
            c.cart_items.create(FactoryBot.attributes_for(:cart_item))
          end
        end
        expect(CartItem.sum_price(cart.cart_items)).to eq 1400
      end
    end

    context 'カートに商品が１つも入っていない時' do
      it '合計金額として0円を返すこと' do
        cart = FactoryBot.create(:cart)
        expect(CartItem.sum_price(cart.cart_items)).to eq 0
      end
    end
  end

  describe '.get_delivery_cash' do
    it '代金の合計が0円から9999円までの時は手数料として300円を返すこと' do
      item = FactoryBot.create(:item, price: 1000)
      cart = FactoryBot.create(:cart) do |c|
        c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id, quantity: 1))
      end
      expect(CartItem.get_delivery_cash(cart.cart_items)).to eq 300
    end

    it '代金の合計が10000円から29999円までの時は手数料として400円を返すこと' do
      item = FactoryBot.create(:item, price: 20000)
      cart = FactoryBot.create(:cart) do |c|
        c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id, quantity: 1))
      end
      expect(CartItem.get_delivery_cash(cart.cart_items)).to eq 400
    end

    it '代金の合計が30000円から99999円までの時は手数料として600円を返すこと' do
      item = FactoryBot.create(:item, price: 40000)
      cart = FactoryBot.create(:cart) do |c|
        c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id, quantity: 1))
      end
      expect(CartItem.get_delivery_cash(cart.cart_items)).to eq 600
    end

    it '代金の合計が100000円以上の時は手数料として1000円を返すこと' do
      item = FactoryBot.create(:item, price: 100001)
      cart = FactoryBot.create(:cart) do |c|
        c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id, quantity: 1))
      end
      expect(CartItem.get_delivery_cash(cart.cart_items)).to eq 1000
    end
  end

  describe '.get_postage' do
    context 'カートに商品が複数入っている時' do
      it '商品の1つ場合は送料として600円を返すこと' do
        cart = FactoryBot.create(:cart) do |c|
          item = FactoryBot.create(:item)
          c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id))
        end
        expect(CartItem.get_postage(cart.cart_items)).to eq 600
      end
      it '商品の5つ場合は送料として600円を返すこと' do
        cart = FactoryBot.create(:cart) do |c|
          5.times do
            item = FactoryBot.create(:item)
            c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id))
          end
        end
        expect(CartItem.get_postage(cart.cart_items)).to eq 600
      end
      it '商品の6つ場合は送料として1200円を返すこと' do
        cart = FactoryBot.create(:cart) do |c|
          6.times do
            item = FactoryBot.create(:item)
            c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id))
          end
        end
        expect(CartItem.get_postage(cart.cart_items)).to eq 1200
      end
      it '商品の10つ場合は送料として1200円を返すこと' do
        cart = FactoryBot.create(:cart) do |c|
          10.times do
            item = FactoryBot.create(:item)
            c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id))
          end
        end
        expect(CartItem.get_postage(cart.cart_items)).to eq 1200
      end
      it '商品の11つ場合は送料として1800円を返すこと' do
        cart = FactoryBot.create(:cart) do |c|
          11.times do
            item = FactoryBot.create(:item)
            c.cart_items.create(FactoryBot.attributes_for(:cart_item, item_id: item.id))
          end
        end
        expect(CartItem.get_postage(cart.cart_items)).to eq 1800
      end
    end

    context 'カートに商品が１つも入っていない時' do
      it '送料として0円を返すこと' do
        cart = FactoryBot.create(:cart)
        expect(CartItem.get_postage(cart.cart_items)).to eq 0
      end
    end
  end
end
