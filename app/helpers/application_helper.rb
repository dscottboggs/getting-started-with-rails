module ApplicationHelper
  def markdown(text)
    if text
      @@options ||= {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
      }

      @@extensions ||= {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
      }
      @@renderer ||= Redcarpet::Render::HTML.new @@options
      Redcarpet::Markdown.new(@@renderer, @@extensions).render(text).html_safe
    end
  end
end
