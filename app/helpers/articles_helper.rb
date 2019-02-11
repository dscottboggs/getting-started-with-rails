module ArticlesHelper
  MAX_SUMMARY_WORDS = 25

  def summarize(text)
    puts "summarizing text: #{text.inspect}"
    if text && (words = text.split(' ')).size > MAX_SUMMARY_WORDS
      words[0..MAX_SUMMARY_WORDS].join(' ') + '...'
    else
      text
    end
  end

  def html_format(text)
    if text
      text.gsub(/(\r?\n)+/, "<br/>")
    end
  end

end
