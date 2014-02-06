module ApplicationHelper
 # class HTMLwithPygments < Redcarpet::Render::HTML
 #   def block_code(code)
 #     sha = Digest::SHA1.hexdigest(code)
 #     Rails.cache.fetch ["code", sha].join('-') do
 #       Pygments.highlight(code)
 #     end
 #   end
 # end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe

  end
end
