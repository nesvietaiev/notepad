require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

puts "Привет! Я твой блокнот! Версия 2 + Sqlite"
puts "Что хотитет записать в блокнот?"

choises = Post.post_types.keys

choise = -1

until choise >= 0 && choise < choises.size

  choises.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choise = STDIN.gets.chomp.to_i
end

entry = Post.create(choises[choise])

entry.read_from_console

id = entry.save_to_db

puts "Ваша запись сохранена, id = #{id}"