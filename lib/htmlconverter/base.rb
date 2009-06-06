module HtmlConverter

class Base
  def initialize
  end

  # HtmlConverter::Base.new.data_to("hello, world", :pdf)
  def data_to(data, format = :pdf)
    render_content(data, self.create_renderer(format))
  end

  # HtmlConverter::Base.new.url_to("http://google.com", :pdf)
  def url_to(url, format = :pdf)
    render_url(url, self.create_renderer(format))
  end

  # HtmlConverter::Base.new.render_content("hello, world", HtmlConverter::Renderer::PDF.new)
  def render_content(source, renderer)
    WebRenderer.new(renderer).render_content(read_content(source))
  end

  # HtmlConverter::Base.new.render_url("http://google.com", HtmlConverter::Renderer::PDF.new)
  def render_url(url, renderer)
    WebRenderer.new(renderer).render_url(url)
  end

  protected
  # format
  # - :pdf
  # - :svg
  # - :png
  # - :ps
  def create_renderer(format)
    case format.to_s
      when "pdf"
        HtmlConverter::Renderer::PDF.new
      when "ps"
        HtmlConverter::Renderer::PS.new
      else
        raise StandardError, "Uknown format: #{format}"
    end
  end

  def read_content(source)
    if source.kind_of?(IO)
      source.read
    elsif File.exist?(source)
      File.read(source)
    else
      source
    end
  end
end

class WebRenderer < Qt::Object
  slots 'render()', "onLoadFinished(bool)"
  signals 'readyToRender()'

  attr_accessor :content

  def initialize(renderer)
    super()

    @app = Qt::Application.new([])
    @page = Qt::WebPage.new
    @renderer = renderer

    Qt::Object.connect(@page, SIGNAL("loadFinished(bool)"),
                       self, SLOT("onLoadFinished(bool)"))
    Qt::Object.connect(self, SIGNAL("readyToRender()"),
                       self, SLOT("render()"))
  end

  def onLoadFinished(ok)
    Qt::Timer::singleShot(0, self, SIGNAL("readyToRender()"))
  end

  def render_url(url)
    @page.mainFrame.load(Qt::Url.new(url))
    @app.exec
    @content
  end

  def render_content(content)
    @page.mainFrame.setContent(Qt::ByteArray.new(content))
    @app.exec
    @content
  end

  def render
    raise "Already rendered" if @app.nil?

    @content = @renderer.render(@page)
    cleanup
  end

  private
  def cleanup
    @app.exit
  end
end

end
