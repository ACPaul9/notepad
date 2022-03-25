class Memo < Post

  def read_from_console
    puts "Новая заметка, (всё что пишите до слова \"end\" )"
    @text = []
    line = nil

    while line != "end" do
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S")}"

    return @text.unshift(time_string)
  end
end
