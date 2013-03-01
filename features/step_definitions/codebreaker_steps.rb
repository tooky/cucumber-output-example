class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given /^I am not yet playing$/ do
end

#START:given
Given /^the secret code is "([^"]*)"$/ do |secret|
  game = Codebreaker::Game.new(output)
  game.start(secret)
end
#END:given

When /^I start a new game$/ do
  game = Codebreaker::Game.new(output)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

