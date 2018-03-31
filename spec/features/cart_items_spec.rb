require 'rails_helper'

RSpec.feature "CartItems", type: :feature do
  scenario "user creates a new cart_item" do
    user = FactoryBot.create(:user)
    FactoryBot.create(:item)
    visit root_path
    click_link "ログイン"
    fill_in "user_email", with: user.email
    fill_in 'user_password', with: user.password
    click_button "ログイン"

    expect{
      click_button "カートに入れる", match: :first
      expect(page).to have_content "追加しました！"
    }.to change{Cart.count}.by(1).and change{CartItem.sum(:quantity)}.by(1)
  end

  scenario "user destroy a cart_item" do
    user = FactoryBot.create(:user)
    FactoryBot.create(:item)
    visit root_path
    click_link "ログイン"
    fill_in "user_email", with: user.email
    fill_in 'user_password', with: user.password
    click_button "ログイン"
    click_button "カートに入れる", match: :first
    click_link "ショッピングカート"
    expect{
      click_link "削除"
    }.to change{CartItem.count}.by(-1)
  end
end
