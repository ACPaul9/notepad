<<<<<<< HEAD
# encoding: utf-8

=======
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
require 'date'

class Task < Post
  def initialize
    super
<<<<<<< HEAD

    @due_date = Time.now
  end

  def read_from_console
    puts 'Что надо сделать?'
    @text = STDIN.gets.chomp

    puts 'К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, ' \
      'например 12.05.2003'
=======
    @due_date = nil
  end

  def read_from_console
    puts "Что нужно сделать?"
    @text = STDIN.gets.chomp

    puts "К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, например 12.07.2007"
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
<<<<<<< HEAD
    deadline = "Крайний срок: #{@due_date.strftime('%Y.%m.%d')}"
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n"

    [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge('text' => @text, 'due_date' => @due_date.to_s)
  end

  def load_data(data_hash)
    super

    @due_date = Date.parse(data_hash['due_date'])
=======
    time_string = "Создано: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S")}"

    deadline = "Крайний срок: #{@due_date}"

    return [deadline, @text, time_string]
>>>>>>> a35a3c29a637038bd493ae1e6786af0af34f6a75
  end
end
