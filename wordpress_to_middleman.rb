
# Input: WordPress XML export file.
# Outputs: a series of Markdown files ready to be included in a middleman site

require 'rubygems'
require 'nokogiri'         
require 'time'
require 'fileutils'

# SETTINGS #
WORDPRESS_XML_FILE_PATH = "#{ENV['PWD']}/wordpress.xml"  # THE LOCATION OF THE EXPORTED WORDPRESS ARCHIVE #
OUTPUT_PATH = "#{ENV['PWD']}/export/_posts/"  # THE LOCATION OF THE SAVED POSTS #
ORIGINAL_DOMAIN = "http://perpetuallybeta.com"  #  THE DOMAIN OF THE WEBSITE #


class Parser

	def self.make_save_path
		unless File.directory?(OUTPUT_PATH)
    		FileUtils.mkdir_p(OUTPUT_PATH)
		end
	end

	def self.xml_to_hash
		xml = Nokogiri::HTML(open(WORDPRESS_XML_FILE_PATH))
		posts = xml.css("item")
		
		posts.each do |post|
			title = post.css("title").text
			puts title
			post_date = post.css("post_date").first.inner_text
			created_at = Date.parse(post_date).to_s
			puts created_at

			tags = ""
			categories = post.xpath("category")
			categories.each do |category|
        		tags += category.css("@nicename").text + ", "
  			end

			content = post.css("encoded").text

			if (post.css("status").text == "publish")
				output_filename = OUTPUT_PATH + created_at + "-" + title + ".markdown"
				puts output_filename

				file_content = "---" + "\n"
				file_content += "title: " + title + "\n"
				file_content += "date: " + post_date + "\n"
				file_content += "tags: " + tags + "\n"
				file_content += "---" + "\n"
				file_content += content

				# temp = open( output_filename, "w") 
				# temp.write(file_content)
				# temp.close

				File.open(output_filename, "w") do |f|     
					f.write(file_content)   
				end

			end
			break;  # DELETE THIS TO PARSE ALL FILES 
		end
	end
end

Parser.make_save_path
Parser.xml_to_hash


