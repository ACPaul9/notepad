<<<<<<< HEAD
# encoding: utf-8

class Memo < Post
  def read_from_console
    puts 'Новая заметка (все, что пишите до строчки "end"):'

    line = nil

    until line == 'end'
=======
class Memo < Post

  def read_from_console
    puts "Новая заметка, (всё что пишите до слова \"end\" )"
    @text = []
    line = nil

    while line != "end" do
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
<<<<<<< HEAD
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n"

    @text.unshift(time_string)
  end

  def to_db_hash
    super.merge('text' => @text.join('\n'))
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('\n')
=======
    time_string = "Создано: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S")}"

    return @text.unshift(time_string)
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
  end
end
