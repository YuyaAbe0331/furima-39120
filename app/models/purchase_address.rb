class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :token
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    @address = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                              building: building, telephone: telephone, purchase_id: @purchase.id)
  end
end
