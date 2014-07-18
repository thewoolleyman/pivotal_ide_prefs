Given(/^that the user has not already installed any prefs$/) do
  system "rm -rf tmp/"
end

When(/^the user installs rubymine prefs$/) do
  system "bin/ide_prefs --ide rubymine --user-prefs-location tmp/RubyminePrefs install 2>&1"
end

Then(/^the prefs should be installed$/) do
  expect(Dir.entries("tmp/RubyminePrefs").size).to be > 2
end


Given(/^that the user has no prefs$/) do
  system "rm -rf tmp/"
end

And(/^then uninstalls the prefs$/) do
  system "bin/ide_prefs --ide rubymine --user-prefs-location tmp/RubyminePrefs uninstall 2>&1"
end

Then(/^the user should not have any prefs$/) do
  expect(Dir.entries("tmp/RubyminePrefs").size).to eq 2
end
