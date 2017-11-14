require 'decisiontree'

class ViableCustomer
  ATTRIBUTES = ['Age', 'Education', 'Income', 'Marital Status']
  # 1 is for Will Buy
  # 0 is for Won't Buy
  # Full training data set - http://www.onlamp.com/pub/a/python/2006/02/09/ai_decision_trees.html
  TRAINING = [
    ['36-55', 'Masters', 'High', 'Single', 1],
    ['18-35', 'High School', 'Low', 'Single', 0],
    ['36-55', 'Masters', 'High', 'Single', 1],
    ['18-35', 'PhD', 'High', 'Married', 1],
    ['< 18', 'High School', 'Low', 'Single', 1],
    ['55+', 'High School', 'High', 'Married', 0],
    ['55+', 'High School', 'High', 'Married', 1],
    ['55+', 'High School', 'High', 'Married', 1],
    ['55+', 'High School', 'High', 'Married', 1],
    ['< 18', 'Masters', 'Low', 'Single', 0]
  ]  
  def initialize(test_data)
    @test_data = test_data
  end

  def predict
    dec_tree = DecisionTree::ID3Tree.new(ATTRIBUTES, TRAINING, 1, :discrete)
    dec_tree.train
    decision = dec_tree.predict(@test_data)
  end

end

# Change test data here
test = ['18-35', 'High School', 'High', 'Single']

puts "Input Data : #{test}"
decision = ViableCustomer.new(test).predict
if decision == 1
  puts "Prediction : Viable customer !"
else
  puts "Prediction : Naah. He won't buy."
end