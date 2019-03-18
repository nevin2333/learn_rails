class CreateProductReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :product_reviews do |t|
      t.string :review, comment: '评论'
      t.integer :member_id, comment: '会员id', index: true
      t.integer :product_id, comment: '产品id', index: true
      t.integer :stars, comment: '星级'
      t.string :status, comment: '好评、差评'

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
