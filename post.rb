<<<<<<< HEAD
# encoding: utf-8

# Подключаем гем для общения с базой данных sqlite3
require 'sqlite3'

class Post

  SQLITE_DB_FILE = 'notepad.sqlite'.freeze

  def self.post_types
    {'Memo' => Memo, 'Task' => Task, 'Link' => Link}
  end

  def self.create(type)
    post_types[type].new
=======
class Post

  def self.post_types
    [Memo, Linq, Task]
  end

  def self.create(type_index)
    return post_types[type_index].new
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
  end

  def initialize
    @created_at = Time.now
<<<<<<< HEAD
    @text = []
  end

  def self.find(limit, type, id)

    db = SQLite3::Database.open(SQLITE_DB_FILE)

    if !id.nil?
      db.results_as_hash = true

      result = db.execute('SELECT * FROM posts WHERE  rowid = ?', id)

      db.close

      if result.empty?
        puts "Такой id #{id} не найден в базе :("
        return nil
      else
        result = result[0]
        post = create(result['type'])
        post.load_data(result)

        post
      end
    else
      db.results_as_hash = false

      query = 'SELECT rowid, * FROM posts '

      query += 'WHERE type = :type ' unless type.nil?

      query += 'ORDER by rowid DESC '

      query += 'LIMIT :limit ' unless limit.nil?

      statement = db.prepare query

      statement.bind_param('type', type) unless type.nil?

      statement.bind_param('limit', limit) unless limit.nil?

      result = statement.execute!

      statement.close

      db.close

      result
    end
=======
    @text = nil
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
  end

  def read_from_console

  end

  def to_strings

  end

<<<<<<< HEAD
  def load_data(data_hash)
    @created_at = Time.parse(data_hash['created_at'])
    @text = data_hash['text']
  end

  def to_db_hash
    {
      'type' => self.class.name,
      'created_at' => @created_at.to_s
    }
  end

  def save_to_db
    db = SQLite3::Database.open(SQLITE_DB_FILE)
    db.results_as_hash = true

    post_hash = to_db_hash

    db.execute(
      'INSERT INTO posts (' +

      post_hash.keys.join(', ') +
      ") VALUES (#{('?,' * post_hash.size).chomp(',')})",
      post_hash.values
    )

    insert_row_id = db.last_insert_row_id

    db.close

    insert_row_id
  end

  def save
    file = File.new(file_path, 'w:UTF-8')

    to_strings.each { |string| file.puts(string) }
=======
  def save
    file = File.new(file_path, 'w:UTF-8') # открываем файл на запись

    to_strings.each do |string|
      file.puts(string)
    end
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)

<<<<<<< HEAD
    file_time = @created_at.strftime('%Y-%m-%d_%H-%M-%S')

    "#{current_path}/#{self.class.name}_#{file_time}.txt"
=======
    # Получим имя файла из даты создания поста и названия класса.
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")
    current_path + '/' + file_name
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
  end
end
