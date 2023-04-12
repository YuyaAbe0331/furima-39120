class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone, presence: true, format: {with: /\A\d{10,11}\z/, message: "Input only number"}
  validates :token, presence: true

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    @address = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, telephone: telephone, purchase_id: @purchase.id)
  end

end