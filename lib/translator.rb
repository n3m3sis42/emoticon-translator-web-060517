require "yaml"
require "pry"

def load_library(file_path)
  emoticon_dictionary = {"get_meaning" => {}, "get_emoticon" => {}}
  library = YAML.load_file(file_path)
  library.each { |meaning, emoticons|
      english_emoticon = emoticons[0]
      japanese_emoticon = emoticons[1]
      emoticon_dictionary["get_meaning"][japanese_emoticon] = meaning
      emoticon_dictionary["get_emoticon"][english_emoticon] = japanese_emoticon
  }
  emoticon_dictionary
end

def get_japanese_emoticon(file_path, english_emoticon)
  japanese_emoticon = load_library(file_path)["get_emoticon"][english_emoticon]
  return japanese_emoticon.nil? ? "Sorry, that emoticon was not found" : japanese_emoticon
end

def get_english_meaning(file_path, japanese_emoticon)
  english_meaning = load_library(file_path)["get_meaning"][japanese_emoticon]
  return english_meaning.nil? ? "Sorry, that emoticon was not found" : english_meaning
end
