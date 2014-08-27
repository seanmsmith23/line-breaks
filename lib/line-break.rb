require 'pp'
require 'pry'

def convert_file(file_out, file_in, length=80)
  file = File.open(file_in, 'r')
  content = file.read
  file.close
  new_content = content.dup

  to_add = ""

  until new_content == ""
    string = new_content.slice!(0,length)
    if string[length-1] == " "
      to_add << (string + "\n")
    else
      backward = string.reverse
      space = backward.index(" ")
      if space == nil
        to_add << backward.reverse
      else
        word = backward.slice!(0,space)
        new_content = word.reverse + new_content
        to_add << (backward.reverse + "\n")
      end
    end
  end

  File.open(file_out, 'w'){|file|file.write(to_add)}

end

convert_file('/Users/seansmith/gSchoolWork/warmups/line-breaks/data/awesome-sauce-test.txt', '/Users/seansmith/gSchoolWork/warmups/line-breaks/data/awesome-sauce.txt', 80)
convert_file('/Users/seansmith/gSchoolWork/warmups/line-breaks/data/I knew them before they were popular.txt','/Users/seansmith/gSchoolWork/warmups/line-breaks/data/I knew them before they were popular-OUTPUT.txt', 80)
convert_file('/Users/seansmith/gSchoolWork/warmups/line-breaks/data/what!?.txt','/Users/seansmith/gSchoolWork/warmups/line-breaks/data/what!_-OUTPUT.txt', 80)
convert_file('/Users/seansmith/gSchoolWork/warmups/line-breaks/data/test_out', '/Users/seansmith/gSchoolWork/warmups/line-breaks/data/test', 20)