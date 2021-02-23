require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

  memo_type = gets.to_i



if memo_type == 1
#新規メモの処理


  puts "拡張子を除いたファイルを取得してください"

  new_memo_title = gets

  puts "メモしたい内容をを記入してください"
  puts "完了したら Ctr + Dをおします"

  new_memo_contents = readlines

  CSV.open("#{new_memo_title}.csv","w") do |csv|
    csv << new_memo_contents
  end



elsif memo_type == 2
    
#既存のメモ編集する処理

  puts "既存のメモ一覧"

  Dir.glob('*.csv').each do |memo|
     puts File.basename(memo,".csv")
  end



  puts "編集するメモ名を入力してください"

  edit_memo = gets.to_s

  if File.exist?("#{edit_memo}.csv")
      
      memo_contents = CSV.read("#{edit_memo}.csv")
      
      puts "メモの内容"
      puts memo_contents
    
      puts "追記内容を記入してくささい"
      puts "完了したら Ctr + Dをおします"
    
      add_memo_contents = readlines
    
      CSV.open("#{edit_memo}.csv","a") do |csv|
        csv << add_memo_contents
      end


  else
    
    puts "メモが見つかりません"
    
  end


else
    
#受け付けない
  puts "1か2を入力して下さい"
    
end