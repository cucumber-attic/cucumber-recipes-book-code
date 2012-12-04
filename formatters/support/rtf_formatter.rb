# START:skeleton
require 'rtf'

class RtfFormatter
  # END:skeleton

  # START:initialize
  def initialize(step_mother, io, options)
    @io  = io

    font = RTF::Font.new(RTF::Font::SWISS, 'Verdana')
    @rtf = RTF::Document.new font # <label id="code.rtf"/>
  end
  # END:initialize

  # START:after_step_result
  def after_step_result(keyword, match, multiline, status,
                        exception, indent, background,
                        file_colon_line)
    @rtf.paragraph do |para|
      para << (status.to_s + ': ' + keyword + match.format_args)
    end
  end
  # END:after_step_result

  # START:after_features
  def after_features(features)
    @io.puts @rtf.to_rtf
  end
  # END:after_features

  # START:skeleton
end
# END:skeleton

class RtfFormatter
  # START:styles
  Styles = {}
  Styles.default = RTF::CharacterStyle.new

  Styles[:passed] = RTF::CharacterStyle.new
  Styles[:passed].foreground = RTF::Colour.new 0, 127, 0 # green

  Styles[:failed] = RTF::CharacterStyle.new
  Styles[:failed].foreground = RTF::Colour.new 127, 0, 0 # red
  Styles[:failed].bold = true
  # END:styles

  # START:formatted_step_result
  def after_step_result(keyword, match, multiline, status,
                        exception, indent, background,
                        file_colon_line)
    @rtf.paragraph do |para|
      para.apply(Styles[status]) do |text|
        text << (status.to_s + ': ' + keyword + match.format_args)
      end
    end
  end
  # END:formatted_step_result
end
