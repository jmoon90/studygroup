module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code)
    #  sha = Digest::SHA1.hexdigest(code)
    #  Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code)
    #  end
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true)
    options = {
      autolink: true,
      filter_html: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer).render(text).html_safe
  end
end
