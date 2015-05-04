require 'git-export.rb'
describe "git-export" do
  it "supports simple section with single key-value pair" do
    file = "[user]\n\tname = John Smith"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"user.name\": \"John Smith\"\n  }\n}"
  end
end