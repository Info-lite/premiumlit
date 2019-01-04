module Jekyll
  class AppendixTag < Liquid::Tag

    Syntax = /(.*)\s+\"(.*)\"\s*/o

    def initialize(tag_name, markup, tokens)
      if markup =~ Syntax
        @link_uri = $1
        @link_text = $2
      else
        raise SyntaxError.new("Syntax Error in 'appendix'")
      end
    end

    def render(context)
      appendix_label = (context.registers[:site].config['appendix_label'] || '参考資料')

      s = %|<div class="link">\n|
      s += %|<span class="label label-info">#{appendix_label}</span>|
      s += %|<a href="#{@link_uri}">#{@link_text}</a>\n|
      s += "</div>\n"

      s
    end
  end
end

Liquid::Template.register_tag("appendix", Jekyll::AppendixTag)
