require 'rails_helper'

RSpec.feature "Orders", type: :feature do
  scenario "user create a new order" do
    user = FactoryBot.create(:user)
    FactoryBot.create(:item)
    FactoryBot.create(:payment)
    FactoryBot.create(:cart_item)
    FactoryBot.create(:ship_time)
    visit root_path
    click_link "ログイン"
    fill_in "user_email", with: user.email
    fill_in 'user_password', with: user.password
    click_button "ログイン"
    click_button "カートに入れる", match: :first
    click_link "ショッピングカート"
    
    expect{
      click_link "レジに進む"
      click_button "注文を確定する"
      expect(page).to have_content "注文が完了しました"
    }.to change{Order.count}.by(1)
  end
end
