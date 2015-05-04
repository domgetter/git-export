require 'git-export.rb'
describe "git-export" do
  it "supports simple section with single key-value pair" do
    file = "[user]\n\tname = John Smith"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"user.name\": \"John Smith\"\n  }\n}"
  end
  
  it "supports simple section with several key-value pairs" do
    file = "[user]\n\tname = John Smith\n\temail = jsmith@gg.com"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"user.name\": \"John Smith\",\n    \"user.email\": \"jsmith@gg.com\"\n  }\n}"
  end
  
  it "supports more than one section, each with one key-value pair" do
    file = "[user]\n\tname = John Smith\n[alias]\n\tc = commit -m"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"user.name\": \"John Smith\",\n    \"alias.c\": \"commit -m\"\n  }\n}"
  end
end