class SubjectDetail < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  with_options presence: true do
    validates :curriculum
    validates :unit
    validates :select_genre_id
    validates :time_genre_id
    validates :week_genre_id
    validates :result_genre_id
  end


  GRADE_GENRE = [
    { id: 1, name: '--' },
    { id: 2, name: '1回生' },
    { id: 3, name: '2回生' },
    { id: 4, name: '3回生' },
    { id: 5, name: '4回生' },
    { id: 6, name: '5回生' },
    { id: 7, name: '6回生' },
    { id: 8, name: '大学院1回生' },
    { id: 9, name: '大学院2回生' },
    { id: 10, name: '大学院3回生' },
    { id: 11, name: '大学院4回生' },
    { id: 12, name: '大学院5回生' },
    { id: 13, name: '大学院6回生' },
    { id: 14, name: 'その他' }
  ]

  def self.grade
    GRADE_GENRE
  end

  

  PERIOD_GENRE = [
    { id: 1, name: '--' },
    { id: 2, name: '前期' },
    { id: 3, name: '後期' },
    { id: 4, name: 'その他' }
  ]

  def self.period
    PERIOD_GENRE
  end
    
     SELECT_GENRE = [
    { id: 1, name: '--' },
    { id: 2, name: '必修科目' },
    { id: 3, name: '選択科目' },
    { id: 4, name: 'その他' }
  ]

    def self.select
      SELECT_GENRE
    end

  WEEK_GENRE = [
    { id: 1, name: '--' },
    { id: 2, name: '月曜日' },
    { id: 3, name: '火曜日' },
    { id: 4, name: '水曜日' },
    { id: 5, name: '木曜日' },
    { id: 6, name: '金曜日' },
    { id: 7, name: '土曜日' },
    { id: 8, name: '日曜日' }
  ]

  def self.week
    WEEK_GENRE
  end


  TIME_GENRE = [
    { id: 1, name: '--' },
    { id: 2, name: '１限目' },
    { id: 3, name: '２限目' },
    { id: 4, name: '３限目' },
    { id: 5, name: '４限目' },
    { id: 6, name: '５限目' },
    { id: 7, name: '６限目' },
    { id: 8, name: '７限目' },
    { id: 9, name: 'その他' }
  ]

  def self.time
    TIME_GENRE
  end

  RESULT_GENRE = [
    { id: 1, name: '--' },
    { id: 2, name: '取得' },
    { id: 3, name: '落第' },
    { id: 4, name: '受講中' }
  ]

  def self.result
    RESULT_GENRE
  end

end
