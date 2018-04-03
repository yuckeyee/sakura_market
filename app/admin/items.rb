ActiveAdmin.register Item do
  permit_params :id, :name, :price, :description, :order, :image

  index do
    column "ID", :id
    column "名前", :name
    column "画像", :image do |obj|
      image_tag(obj.image.url(:thumb))
    end
    column "価格", :price  
    column "表示順", :order 
    actions
  end

  form multipart: true do |f|
    f.inputs '商品登録' do
      f.input :name
      f.input :price
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:medium))
      f.input :order
      f.actions
    end
  end

  show do |b|
    attributes_table do
      row '名前' do
        resource.name
      end
      row '価格' do
        resource.price
      end
      row '表示順' do
        resource.order
      end
      row '画像' do
        image_tag(b.image.url(:medium))
      end
    end
  end
end
