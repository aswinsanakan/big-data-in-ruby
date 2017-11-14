require 'decisiontree'

class HealthPrediction
  ATTRIBUTES = ['Temperature']
  TRAINING = [
      [36.6, 'healthy'],
      [37, 'sick'],
      [38, 'sick'],
      [36.7, 'healthy'],
      [40, 'sick'],
      [50, 'really sick'],
    ]
  
  def initialize(test_data)
    @test_data = test_data
  end

  def predict
    dec_tree = DecisionTree::ID3Tree.new(ATTRIBUTES, TRAINING, 'sick', :continuous)
    dec_tree.train
    decision = dec_tree.predict(@test_data)
  end

end

puts "Enter the temperature : "
temperature = gets.to_i

choice = 0
loop do
  puts "Choose a prediction : "
  puts  "1 - Healthy \n2 - Sick \n3 - Really sick : "
  choice = gets.to_i
  break if (1..3).include?(choice)
end

prediction = case choice
  when 1 then 'healthy'
  when 2 then 'sick'
  when 3 then 'really sick'
end

test_data = [temperature, prediction]
decision = HealthPrediction.new(test_data).predict

puts "----------------------------------"
puts "User predicted: #{test_data.last}"
puts "Actual diagnosis: #{decision}"
puts "----------------------------------"
puts "DISCLAIMER: This is a machine predicted diagnosis and shouldn't be considered for medical purposes."
