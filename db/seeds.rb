ladies = Category.create(name: 'レディース')
outer, bouttoms, tops, life, shoes, bag, accessory = ladies.children.create(
  [
    { name: 'アウター' },
    { name: 'ボトムス' },
    { name: 'トップス' },
    { name: 'ライフ' },
    { name: 'シューズ' },
    { name: 'バッグ' },
    { name: 'アクセッサリー' },
  ]
)

['コート', 'レザー', 'ブルゾン', 'ジャケット'].each do |name|
  outer.children.create(name: name)
end

['デニム', 'スウェットパンツ', 'スキニー・スリム','ワイド・イージー','ショート・ハーフ','スラックス'].each do |name|
  bouttoms.children.create(name: name)
end

['ワンピース','Tシャツ','ロングスリーブ','シャツ・カーディガン','スウェット・フード','ニット','ベスト・ジレ','レイヤード・タンク'].each do |name|
  tops.children.create(name: name)
end

['フレグランス'].each do |name|
  life.children.create(name: name)
end

['スニーカー', 'レザーシューズ', 'ブーツ', 'サンダル'].each do |name|
  shoes.children.create(name: name)
end

['クラッチ', 'ボストン・トート', 'ショルダー・2/3way', 'バックパック', 'ボディーバッグ'].each do |name|
  bag.children.create(name: name)
end

['ウォレット', 'ネックレス', 'リング', 'キーケース','ブレスレット','ストール','ベルト','ヘッドウェア','アイウェア','その他'].each do |name|
  accessory.children.create(name: name)
end


mens = Category.create(name: 'メンズ')
outer, bouttoms, tops, life, shoes, bag, accessory = mens.children.create(
  [
    { name: 'アウター' },
    { name: 'ボトムス' },
    { name: 'トップス' },
    { name: 'ライフ' },
    { name: 'シューズ' },
    { name: 'バッグ' },
    { name: 'アクセッサリー' },
  ]
)

['コート', 'レザー', 'ブルゾン', 'ジャケット'].each do |name|
  outer.children.create(name: name)
end

['デニム', 'スウェットパンツ', 'スキニー・スリム','ワイド・イージー','ショート・ハーフ','スラックス'].each do |name|
  bouttoms.children.create(name: name)
end

['Tシャツ','ロングスリーブ','シャツ・カーディガン','スウェット・フード','ニット','ベスト・ジレ','レイヤード・タンク'].each do |name|
  tops.children.create(name: name)
end

['フレグランス'].each do |name|
  life.children.create(name: name)
end

['スニーカー', 'レザーシューズ', 'ブーツ', 'サンダル'].each do |name|
  shoes.children.create(name: name)
end

['クラッチ', 'ボストン・トート', 'ショルダー・2/3way', 'バックパック', 'ボディーバッグ'].each do |name|
  bag.children.create(name: name)
end

['ウォレット', 'ネックレス', 'リング', 'キーケース','ブレスレット','ストール','ベルト','ヘッドウェア','アイウェア','その他'].each do |name|
  accessory.children.create(name: name)
end 