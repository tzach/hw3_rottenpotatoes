# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #Movie.all.each do |movie|
  #  puts movie.title
  #end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"


When /I (un)?check the following ratings:\s*(\S.*)/ do |uncheck, rating_list|
  rating_list.split(/, /).each do |x|
    if (uncheck == nil)
      puts("ratings["+x+"]")
      check("ratings["+x+"]")
    else
      uncheck("ratings["+x+"]")
    end
  end
end

Then /I should see all of the movies/ do
  page.all('table#movies tbody tr').count.should == movies_table.hashes.count
end
