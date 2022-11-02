Given /the following profiles exist/ do |match_table|
  match_table.hashes.each do |match|
    User.create(match)
  end
end

# Then   I should see the following names: Marcus, Zhen, Jack, Hang

Then /^I should (not )?see the following names: (.*)$/ do |no, match_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  matches = match_list.split(", ")
  matches.each do |match|
    if no
      step %Q{I should not see "#{match}"}
    else
      step %Q{I should see "#{match}"}
    end
  end
end

# I should see the following questions: Name, Sexuality, Gender, Birthday, Height, Interest
Then /^I should (not )?see the following questions: (.*)$/ do |no, question_list|
  # Take a look at web_steps.rb Then /^(?:|I )should see "([^"]*)"$/
  questions = question_list.split(", ")
  questions.each do |question|
    if no
      step %Q{I should not see "#{question}"}
    else
      step %Q{I should see "#{question}"}
    end
  end
end