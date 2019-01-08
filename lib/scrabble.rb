
class Scrabble

  def initialize(word)
    @word = word
  end

  SCORES_DIRECTORY = [{1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]},
  {2 => ["D", "G"]},
  {3 => ["B","C","M","P"]},
  {4 => ["F","H","V","W","Y"]},
  {5 => ["K"]},
  {8 => ["J", "X"]},
  {10 => ["Q", "Z"]}]
 
 def score 
    if @word != nil
      engine(@word)
    elsif @score == " \t\n" || @score == nil
      0
    end
  end

  def engine(word)  
    array = word.upcase.chars
    map_over(array)    
  end

  def map_over(array)
    points = 0
    array.map do |letter|
      SCORES_DIRECTORY.each do |e|
        points = points + e.keys.reduce(:+) if e.values.flatten.include?(letter)
      end
    end
    points
  end
 
end

scrabble = Scrabble.new('')
# scrabble.score.to_i