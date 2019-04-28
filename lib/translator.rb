require "yaml"

def load_library(path)
	#create lookup table structure
	table = {}
	table["get_meaning"] = {}
	table["get_emoticon"] = {}
	
	#populate lookup table
	YAML.load_file(path).each do |emotion, symbols|
		table["get_meaning"][symbols[1]] = emotion
		table["get_emoticon"][symbols[0]] = symbols[1]
	end	
	
	table
end

def get_japanese_emoticon(path, emoticon)
	#load table
	table = load_library(path)
	
	#look up english emoticon and return result
	if table["get_emoticon"].keys.include?(emoticon)
		return table["get_emoticon"][emoticon]
	else
		return "Sorry, that emoticon was not found"	
	end
end

def get_english_meaning(path, emoticon)
	#load table
	table = load_library(path)
	
	#look up japanese emoticon and return result
	if table["get_meaning"].keys.include?(emoticon)
		return table["get_meaning"][emoticon]
	else
		return "Sorry, that emoticon was not found"
	end	
end