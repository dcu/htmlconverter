module HtmlConverter
module Renderer

class Base
  def initialize
  end

  def render(page)
    raise NotImplementedError
  end

  protected
  def generate(&block)
    filename = Dir.tmpdir+"/htmlconverter.#{rand(256)}.#{rand(256)}.#{rand(256)}.#{rand(256)}"
    cont = nil

    yield filename

    if File.exist?(filename)
      cont = File.read(filename)
      File.unlink(filename)
    end

    cont
  end
end

end
end
