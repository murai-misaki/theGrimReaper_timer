# 4日分のデータを作成
4.times do |n|
  date = n.days.ago # n.days.agoはRailsのActive Supportライブラリによって提供される便利なメソッドであり、指定した日数の時間差を適用した現在の日時を返します。例えば、1.day.agoは1日前の日時を返します。

  # データの作成処理
    OneDayTime.create!(count_up: 30*n, exercise: n, shortened_lifespan: 22*n, user_id: User.first.id , created_at: date, updated_at: date)
    puts "#{n}日前のメッセージを作成しました"
end

puts "4日分の作成が完了しました"
