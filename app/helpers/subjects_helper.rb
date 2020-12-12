module SubjectsHelper
  def genre_select
    select_genre = ['0', '--', '必修科目','選択科目', 'その他']
  end

  def genre_time
    time_genre = ['0', '--','１限目', '２限目','３限目','４限目','５限目','６限目','７限目','その他']
  end

  def genre_result
    result_genre = ['0', '--','取得','落第','受講中' ]
  end

  def genre_week
    week_genre = ['0','--','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日','日曜日']
  end

end
