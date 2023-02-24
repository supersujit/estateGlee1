class Property < ApplicationRecord
  enum status: [:listed, :viewing, :financing, :payment, :sold]
end
