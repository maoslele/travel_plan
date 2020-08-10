require "active_support/core_ext/numeric/conversions"

plans = [
  {place:"沖縄", price:10000},
  {place:"北海道", price:20000},
  {place:"九州", price:15000},
]

puts "旅行プランを選択してください"
plans.each_with_index do |plan, num|
  num += 1
  puts "#{num}. #{plan[:place]}旅行(¥#{plan[:price].to_s(:delimited)})"
end

print "プランを選択 > "
selected_num = gets.chomp.to_i - 1
if selected_num < 0 || selected_num >= plans.size
  puts "該当プランが見つかりません" 
  return
end

puts "#{plans[selected_num][:place]}旅行ですね、何人で行きますか？"
print "人数を入力 > "
people = gets.chomp.to_i

def total_price(price, people)
  sum = price * people
  if people >= 5
    puts "5人以上なので10%引きです"
    sum *= 0.9
  end
  puts "合計料金:¥#{sum.floor.to_s(:delimited)}"
end

total_price(plans[selected_num][:price], people)
