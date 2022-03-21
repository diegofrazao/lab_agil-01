class AnalisadorLinha
  
  def initialize (number_line, line)
    @number_line = number_line
    @line = line
  end

  def frequency_analysis 
    count = 0
    words_split = @line.split
    hash_words = words_split.group_by(&:itself).transform_values(&:count)
    
    hash_words.each do |word, frequency|
      if frequency > count
        @words = word
        @frequency, count = frequency
      end
    end
  end

  def to_str
    return "Palavra com mais frequencia: '#{@words}' -> #{@frequency}" + "\n" + "Linha: #{@number_line} -> #{@line}"
  end
end

analisador_linhas = []
File.open("foo").each { |line| analisador_linhas << AnalisadorLinha.new($., line.rstrip) }

analisador_linhas.each_with_index do |a, idx|
  a.frequency_analysis
  puts
  puts "Instancia #{idx+1}"
  puts a.to_str
end
