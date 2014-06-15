Wordpress to Middleman Exporter
===============================

A Ruby Script that will convert your exported Wordpress XML into markdown files with the appropriate [frontmatter](http://middlemanapp.com/basics/frontmatter/) metadata so that they are consumable by Middleman.

Getting Started
----

1.  Open up the wordpress_to_middleman.rb file and setup the following three variables
	- WORDPRESS_XML_FILE_PATH (The path to the exported wordpress.xml file)
	- OUTPUT_PATH (The path where all of the markdown posts will be saved)
	- ORIGINAL_DOMAIN (The domain of the original website)
2.  Ensure that all of the required gems are installed - two in specific that are required are:
	- nokogiri
	- upmark
3.  Remove the following lines from the exported Wordpress XML (They mess with nokogiri's parser):
		<!-- Debugging help, do not remove -->
		<meta name="Framework" content="Kpress" />
		<meta name="Theme Version" content="1.4.1" />
		<meta name="Framework Version" content="1.4" />
		<meta name="CMS Version" content="3.5.2" />

3.  In the terminal, navigate to the folder where the project has been saved, and run 
		ruby wordpress_to_middleman.rb


### Please Note that this is a work in progress.  Contributions welcome.


