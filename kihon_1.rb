ああああ



puts("課題：基本1")
# ランダム処理

# 英数字の配列を生成
number = [*(0..9)]
big_letter = [*("a".."z")]
small_letter = [*("A".."Z")]

# 指定の文字を取り除く
number.delete(0)
number.delete(1)
small_letter.delete("l")
big_letter.delete("I")
big_letter.delete("O")

# 結合して英数字の配列を生成
alphanumeric = number + small_letter + big_letter

# 配列からランダムに取り出して文字列に代入
# random_alphanumeric = alphanumeric.sample(8).join
# puts random_alphanumeric


# Data配列を作成
data = Array.new

#入力
puts("実行回数を入力してください")
# 入力を受け付け、timesに代入
input = STDIN.gets.chomp.to_i
# inputを表示
puts ("#{input}回実行します")

# inputだけ繰り返し
input.times{
	# 配列からランダムに取り出して文字列に代入
	# メールアドレス
	random_alphanumeric = alphanumeric.sample(8).join
	mail =  (random_alphanumeric + "@backstore.jp")
	# puts mail

	# パスワード
	random_alphanumeric = alphanumeric.sample(8).join
	passwd = (random_alphanumeric)
	# puts passwd

	#配列に代入
	data << [mail, passwd]	
}

# 配列を表示
# p data

# CSVを出力	
require 'csv'
CSV.open("accounts.csv", "w",) do |writer|
	writer << ["アカウント", "パスワード"]
	data.each do |item|
		writer << item
	end
end