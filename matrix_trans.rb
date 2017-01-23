class Matrix

  attr_reader :file_content, :content

  def initialize(file)
    @file_content = File.open(file).read 

    parse
  end  

  def transpose
    new_array = []
    
    #i = content.count
    j = content.first.count

    j.times do |idx|
      new_array << content.map{|a| a[idx]}  
    end   

    new_array
  end  

  def transpose_and_save(file_name = 'matrix_transposed')
    transposed_content = transpose

    File.open("#{file_name}.txt", 'w') do |file| 
      transposed_content.each do |i|
        file.puts i.join(' ')
      end  
    end  
  end   

  private

  def parse
    @content = file_content.split("\n")
    @content = @content.map{|i| i.split(' ').map(&:to_i) }
    @content  
  end  
end  

#Transpose and save into the file
# puts Matrix.new('matrix.txt').transpose_and_save

# Transpose
puts Matrix.new('matrix.txt').transpose.inspect

