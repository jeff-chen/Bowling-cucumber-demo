Given /a player named (.*)/i do |player|
  Player.create!(:name => player)
end

Given /^a new bowling game$/ do
  $game = Game.create!
  Player.all.each{|p| Session.create!(:player => p, :game => $game)}
end

Then /^([^"]*) should have (\d+) points$/ do |name, points|
  within("##{name.underscore}_game li#score") do
    response.should contain("#{points}")
  end
end

Given /^([^"]*) has the following scores:$/ do |player, table|
  player_id = Player.find_by_name(player).id
  table.hashes.each do |hash|
    Frame.create!(:attributes => hash.merge(:session => Session.find_by_player_id(player_id)))
  end
end

When /^([^"]*) bowls a (\d+) and a (\d+) for the next frame$/ do |player, arg1, arg2|
  player = Player.find_by_name(player)
  session = Session.find_by_game_id_and_player_id($game.id, player.id)
  next_turn = session.next_turn
  frame = Frame.create!(:session => session, :turn => next_turn)
  visit frame_path({:controller=>"frames", :action=>"edit", :session_id => session.id, :turn => frame.turn})
  When %{I fill in \"First Frame\" with \"#{arg1.to_s}\"}
  When %{I fill in \"Second Frame\" with \"#{arg2.to_s}\"}
  When %{I press \"Update\"}
end

Then /^([^"]*) should see "([^"]*)" for frame (\d+)$/ do |player, arg1, arg2|
  within("##{player.underscore}_game li#frame_#{arg2}") do |thing|
    thing.should contain("#{arg1}")
  end
end
