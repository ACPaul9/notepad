# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "post.rb"
require_relative "linq.rb"
require_relative "memo.rb"
require_relative "task.rb"

puts "Привет, я твой блокнот!"
puts
puts "Что хотите записать в блокнот?"

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = STDIN.gets.chomp.to_i
end

type_of_notepad = Post.create(choice)

type_of_notepad.read_from_console

type_of_notepad.save

puts "Ваша запись сохранена!"
