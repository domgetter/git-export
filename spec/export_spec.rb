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
  
  it "supports sections with sub-sections" do
    file = "[section \"subsection\"]\n\tsomekey = some value"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"section.subsection.somekey\": \"some value\"\n  }\n}"
  end
  
  it "supports sections with sub-sub-sections" do
    file = "[section \"subsection.more\"]\n\tsomekey = some value"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"section.subsection.more.somekey\": \"some value\"\n  }\n}"
  end
  
  it "ignores comments on their own line" do
    file = "[user]\n\t; This is my username\n\tname = John Smith"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"user.name\": \"John Smith\"\n  }\n}"
  end
  
  it "ignores blank lines" do
    file = "[user]\n\t\n\n\n\tname = John Smith"
    json = Git::Export.export(file)
    expect(json).to eq "{\n  \"global\": {\n    \"user.name\": \"John Smith\"\n  }\n}"
  end
  
  it "supports multi-line values" do
    file = "[user]\n\tname = John\\\n\tSmith\n"
    json = Git::Export.export(file)
    expect(json).to eq("{\n  \"global\": {\n    \"user.name\": \"John\\tSmith\"\n  }\n}")
  end
  it "ignores comments at the end of lines"
end