module Jekyll
  class ScreenshotTag < Liquid::Tag

    Syntax = /(.*)\s+\"(.*)\"\s*/o

    def initialize(tag_name, markup, tokens)
      if markup =~ Syntax
        @file_uri = $1
        @description = $2
      else
        raise SyntaxError.new("Syntax Error in 'screenshot'")
      end
    end

    def render(context)

      image_src = @file_uri
      if /^(https?:)?\/\/?/ !~ @file_uri
        image_dir = (context.registers[:site].config['screenshot_dir'].sub(/^\//,'') || '/images/screenshot')
        image_src = "#{image_dir}/#{image_src}"
      end

      s = %|<div class="thumbnail">\n|
      s += %|<a href="#{image_src}" data-toggle="lightbox" data-title="#{@description}">|
      s += %|<img class="img-responsive" src="#{image_src}">|
      s += "</a>\n"
      s += %|<div class="caption">#{@description}</div>\n|
      s += "</div>\n"

      s
    end
  end
end

Liquid::Template.register_tag("screenshot", Jekyll::ScreenshotTag)
