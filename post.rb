class Post

  def self.post_types
    [Memo, Linq, Task]
  end

  def self.create(type_index)
    return post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console

  end

  def to_strings

  end

  def save
    file = File.new(file_path, 'w:UTF-8') # открываем файл на запись

    to_strings.each do |string|
      file.puts(string)
    end

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)

    # Получим имя файла из даты создания поста и названия класса.
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")
    current_path + '/' + file_name
  end
end
