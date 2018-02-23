
#This should be in ~/dotfiles

require 'pathname'
XCODE_THEME_DIR = Pathname.new(File.expand_path("~/Library/Developer/Xcode/UserData/FontAndColorThemes"))

def path
  Pathname.new(File.dirname(__FILE__))
end

def xcode_theme
  if !Dir.exists?(XCODE_THEME_DIR)
    puts "creating directory #{XCODE_THEME_DIR}"
    Dir.mkdir(XCODE_THEME_DIR)
  end
  
  subpath = path + "Xcode" + "FontAndColorThemes"
  subpath.children.each do |child_path|
    if child_path.extname == '.dvtcolortheme'
      link_path = XCODE_THEME_DIR + child_path.basename
      if File.exists? link_path
        puts "File exists at #{link_path}. "
      else
        puts "creating hard link at #{link_path} to #{child_path}"
        File.link(child_path, link_path)  
      end      
    end
  end
end


def path_in_home(filename)
  File.expand_path("~/#{filename}")
end

def path_in_dotfiles(filename)
  path + filename
end

def open_in_dotfiles(filename)
  puts "opening gs.terminal"
  if system('open', "#{(path + filename)}")
    puts "  successfully opened terminal theme"
  else
    puts "  failed to open terminal theme"
  end 
end

def create_symlink(existing, link)
  if File.exists? link
    puts "#{link} already exists"
  else
    puts "creating symbolic link at #{link} to #{existing}"
    File.link(existing, link)  
  end
end

def standard_symlink(filename_without_dot)
  create_symlink(path_in_dotfiles(filename_without_dot), path_in_home(".#{filename_without_dot}"))
end


xcode_theme
standard_symlink("bash_profile")
standard_symlink("gitignore")
standard_symlink("gitconfig")
standard_symlink("tmux.conf")
open_in_dotfiles("gs.terminal")
