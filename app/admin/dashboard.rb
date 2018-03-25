ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Recent Items" do
      table_for Item.order("created_at desc").limit(5) do
        column :name
        column :created_at
      end
      strong { link_to "すべての商品を見る", admin_items_path }
    end
  end
end
