class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '果菜類' },
    { id: 3, name: '葉茎類' },
    { id: 4, name: '根菜類' },
    { id: 5, name: '菌茸類' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
