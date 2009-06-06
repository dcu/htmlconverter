module HtmlConverter
module Renderer

class PS < HtmlConverter::Renderer::Base
  def render(page)
    printer = Qt::Printer.new(Qt::Printer::HighResolution)
    generate do |filename|
      printer.setOutputFileName(filename)
      printer.setOutputFormat(Qt::Printer::PostScriptFormat)

      page.mainFrame.print(printer)
    end
  end
end

end
end
