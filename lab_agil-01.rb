class AnalisadorLinha
  
  def initialize (number_line, line)
    @number_line = number_line
    @line = line
  end

  def frequency_analysis 
    count = 0
    @words = []
    words_split = @line.split
    hash_words = words_split.group_by(&:itself).transform_values(&:count)

    hash_words.each do |word, frequency|
      if frequency > count
        count = frequency
        @frequency = frequency
      end
    end
    
    hash_words.each {|word, frequency| @words << word if frequency == count }

  end

  def to_str
    return "Palavra com mais frequencia: '#{@words}'" + "\n" + "Frequencia da palavra: #{@frequency}" + "\n" + "Linha: #{@number_line} -> #{@line}"
  end
end

analisador_linhas = []
File.open("foo").each { |line| analisador_linhas << AnalisadorLinha.new($., line.rstrip) }

analisador_linhas.each_with_index do |a, idx|
  a.frequency_analysis
  puts
  puts "Instancia 0#{idx+1}"
  puts a.to_str
end