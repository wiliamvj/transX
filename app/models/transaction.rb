class Transaction < ApplicationRecord
  enum :transaction_type, { out_money: "saida", deposit: "entrada" }

  belongs_to :user

  validates :date, comparison: { less_than_or_equal_to: proc { Date.current } }
  validates :description, length: { maximum: 150 }
  validates :transaction_value, presence: true
  validates :transaction_type, presence: true

  validate :validate_is_there_money

  def self.total_money
    self.deposit.sum(:transaction_value) - self.out_money.sum(:transaction_value)
  end

  private

  def validate_is_there_money
    return unless user
    return if deposit?
    return if transaction_value.to_f <= user.transactions.total_money
    errors.add :transaction_value, "Without balance"
  end
end
