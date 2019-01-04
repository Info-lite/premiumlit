module Jekyll
  class ScreencastTag < Liquid::Tag

    Syntax = /(.*)\s+\"(.*)\"\s*/o

    def initialize(tag_name, markup, tokens)
      if markup =~ Syntax
        @file_name = $1
        @description = $2
      else
        raise SyntaxError.new("Syntax Error in 'screencast'")
      end
    end

    def render(context)

      video_src = @file_name
      if /^(https?:)?\/\/?/ !~ @file_name
        video_dir = (context.registers[:site].config['screencast_dir'].sub(/^\//,'') || '/videos/screencast')
        video_src = "#{video_dir}/#{video_src}"
      end

      s =  %|<button type="button" class="btn btn-info pull-right" data-toggle="modal" data-target="##{@file_name}Modal">\n|
      s += %|<i class="fa fa-play-circle-o fa-lg"></i>&nbsp;操作動画\n|
      s += %|</button>\n|
      s += %|<div class="modal fade" id="#{@file_name}Modal" tabindex="-1" role="dialog" aria-labelledby="#{@file_name}ModalLabel" aria-hidden="true">\n|
      s += %|<div class="modal-dialog"><div class="modal-content">\n|
      s += %|<div class="modal-header">\n|
      s += %|<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\n|
      s += %|<span class="modal-title" id="#{@file_name}ModalLabel">#{@description}</span>\n|
      s += %|</div>\n|
      s += %|<div class="modal-body">\n|
      s += %|<div class="flowplayer is-splash color-light img-responsive" style="max-width:854px;">\n|
      s += %|<video>\n|
      s += %|<source type="video/mp4" src="#{video_src}.mp4">\n|
      s += %|</video>\n|
      s += %|</div>\n|
      s += %|</div>\n|
      s += %|</div></div>\n|
      s += %|</div>\n|

      s
    end
  end
end

Liquid::Template.register_tag("screencast", Jekyll::ScreencastTag)
