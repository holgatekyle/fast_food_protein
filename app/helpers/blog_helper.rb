# app/helpers/blog_helper.rb
module BlogHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(text)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def preserve_markdown(text) # Used to get the indentation right in the <pre> code blocks with Haml
     markdown(text)
  end
end
