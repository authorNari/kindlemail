VALID_FILE_TYPES = { 
".doc" => "Microsoft Word", 
".rtf" => "Rich Text Format", 
".jpeg" => "JPEG image file",
".jpg" => "JPEG image file",
".gif" => "GIF image file",
".png" => "PNG image file",
".bmp" => "BMP image file",
".html" => "Hypertext Markup Language", 
".htm" => "HyperText Markup Language", 
".txt" => "Text files", 
".mobi" => "Mobile ebooks",
".prc" => "Mobile ebooks",
".pdf" => "Portable Document Format (experimental)" }
SEE_HELP = "\nUse the -h flag for usage details"
USER_DIR = "~/.kindlemail"
STORAGE_DIR = USER_DIR + "/.storage"
STAGING_DIR = USER_DIR + "/.staging"
EMAIL_CONF_FILE = File.expand_path(USER_DIR + "/.email_conf")
USER_CONF_FILE = File.expand_path(USER_DIR + "/.kindlemail")

version_file = File.expand_path(File.join(File.dirname(__FILE__), "../", "VERSION"))
File.open(version_file, 'r') do |file| 
  APP_VERSION = file.gets
end

HOMEPAGE = "https://github.com/djhworld/kindlemail"
AUTHOR = "djhworld"
VERSION_STRING = "kindlemail #{APP_VERSION}. Written by #{AUTHOR}. #{HOMEPAGE}"
FILE_STORE = File.expand_path(STORAGE_DIR + "/sent_files.history")


