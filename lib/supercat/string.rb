require 'digest/md5'

class String
  
  def starts_with str
    return self[0...str.length] == str
  end
  
  def md5
    return Digest::MD5.hexdigest(self)
  end
  
  #
  # A better titleize that creates a usable
  # title according to English grammar rules.
  #
  def titleize
    count  = 0
    result = []
    
    for w in self.downcase.split
      count += 1
      if count == 1
        # Always capitalize the first word.
        result << w.capitalize
      else
        unless ['a','an','and','by','for','in','is','of','not','on','or','over','the','to','under'].include? w
          result << w.capitalize
        else
          result << w
        end
      end
    end
    
    return result.join(' ')
  end
  
  #
  # Replace my value with the titleized version.
  #
  def titleize!
    replace titleize
  end
end
