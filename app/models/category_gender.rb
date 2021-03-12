class CategoryGenger < ActiveHash::Base
  self.data = [
    { id: 1, name: 'メンズ' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'ユニセックス' }
  ]

  include ActiveHash::Associations
  has_many :items
  
end