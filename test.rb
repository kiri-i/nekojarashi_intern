puts("課題：応用1用のテスト")
# ランダム処理

# 英数字の配列を生成
number = [*(0..9)]
big_letter = [*("A".."Z")]
small_letter = [*("a".."z")]

# 英数字の配列
alphanumeric = number + small_letter + big_letter

# 指定の文字を取り除く
number.delete(0)
number.delete(1)
big_letter.delete("I")
big_letter.delete("O")
small_letter.delete("l")

# 例外を排除した英数字配列
alphanumeric_Exclusion = number + small_letter + big_letter

# 配列を作成
data = Array.new				# 出力用
data_check = Array.new	# 重複確認用

#入力
puts("実行回数を入力してください")
# 入力を代入
input = STDIN.gets.chomp.to_i
# inputを表示
puts ("#{input}回実行します")

# inputだけ繰り返し
input.times{
	# 配列からランダムに取り出して文字列に代入
	# メールアドレス
	random_alphanumeric = alphanumeric.sample(2).join
	mail_account = random_alphanumeric
	mail_address =  (mail_account + "@backstore.jp")

	# パスワード
	random_alphanumeric_Exclusion = alphanumeric_Exclusion.sample(2).join
	passwd = (random_alphanumeric_Exclusion)

	#配列に代入
	data << [mail_address, passwd]
	data_check << [mail_account, passwd]
}


# 配列を表示
# p data.size
# p data.uniq.size

# 重複個数
overlap = data_check.size - data_check.uniq.size
p overlap

until overlap == 0 do
	overlap = data_check.size - data_check.uniq.size

	random_alphanumeric = alphanumeric.sample(2).join
	mail_account = random_alphanumeric
	mail_address =  (mail_account + "@backstore.jp")

	# パスワード
	random_alphanumeric_Exclusion = alphanumeric_Exclusion.sample(2).join
	passwd = (random_alphanumeric_Exclusion)

	#配列に代入
	data << [mail_address, passwd]
	data_check << [mail_account, passwd]

	overlap = data_check.size - data_check.uniq.size
	data_check.uniq!

	p overlap
end

p overlap




# dataをCSVで出力
require 'csv'
CSV.open("test_accounts.csv", "w",) do |writer|
	writer << ["アカウント", "パスワード"]
	data.each do |item|
		writer << item
	end
end

# data_checkをCSVで出力
require 'csv'
CSV.open("test_data_check.csv", "w",) do |writer|
	writer << ["アカウント", "パスワード"]
	data_check.each do |item|
		writer << item
	end
end
