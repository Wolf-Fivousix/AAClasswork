require "singleton"
require "sqlite3"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super("questions.db")
    # self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless data.length > 0

    User.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless data.length > 0

    data.map { |name| User.new(name) }
  end

  def initialize(choices)
    @id = choices["id"]
    @fname = choices["fname"]
    @lname = choices["lname"]
  end

  def authored_questions
    Question.find_by_author_id(id)
  end
end


class Question
  attr_accessor :id, :body, :title, :user_id
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL

    return nil unless data.length > 0

    Question.new(data.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL,author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
     SQL
     return nil unless data.length > 0
     data.map {|question| Question.new(question)}
  end

  def initialize(choices)
    @id = choices["id"]
    @body = choices["body"]
    @title = choices["title"]
    @user_id = choices["user_id"]
  end
end

class Reply
  attr_accessor :id, :quest_id, :parent_reply, :body, :her_id
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL

    return nil unless data.length > 0

    Reply.new(data.first) 
  end

  def self.find_by_user_id(user_id)
     data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        her_id = ?
     SQL
     return nil unless data.length > 0
     data.map {|statement| Reply.new(statement)}
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        quest_id = ?
     SQL
     return nil unless data.length > 0
     data.map {|quest| Reply.new(quest)}
  end

  def initialize(choices)
    @id = choices["id"]
    @quest_id = choices["quest_id"]
    @parent_reply = choices["parent_reply"]
    @body = choices["body"]
    @her_id = choices["her_id"]
  end
end

class QuestionFollows
  attr_accessor :id, :question_id, :user_id
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      question_follows
    WHERE
      id = ?
    SQL

    return nil unless data.length > 0

    QuestionFollows.new(data.first) 
  end

  def initialize(choices)
    @id = choices["id"]
    @question_id = choices["question_id"]
    @user_id = choices["user_id"]
  end
end

class QuestionLike
   attr_accessor :id, :quest_id, :user_id
  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      question_likes
    WHERE
      id = ?
    SQL

    return nil unless data.length > 0

    QuestionLike.new(data.first) 
  end

  def initialize(choices)
    @id = choices["id"]
    @quest_id = choices["quest_id"]
    @user_id = choices["user_id"]
  end
end
# p User.find_by_id(1)
# p QuestionFollows.find_by_id(2)
# p Reply.find_by_id(3)
# p Question.find_by_author_id(4)
# # p User.find_by_id(5)
# # p Reply.find_by_user_id(2)
# # p Reply.find_by_user_id(6)
# # p Reply.find_by_question_id(5)
# # p Reply.find_by_question_id(1)
# p User.find_by_name("Claudius", "Solomon")

# wolf = User.new('Claudius')
# p wolf
# p wolf.authored_questions

 solomon = User.find_by_name('Claudius', 'Solomon').first
# p Question.find_by_author_id(solomon.id)

p solomon.authored_questions