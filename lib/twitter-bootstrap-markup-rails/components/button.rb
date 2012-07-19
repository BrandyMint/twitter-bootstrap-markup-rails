module Twitter::Bootstrap::Markup::Rails::Components
  class Button < Base
    include ActionView::Helpers::UrlHelper

    attr_reader :text

    def initialize(text, link, options = {})
      super
      @text = text
      @link = url_for(link)
    end

    def to_s
      html_text = ""
      html_text << build_icon.html_safe << ' ' if options[:icon].blank?
      html_text << text
      html_text << ' ' << build_caret.html_safe if options[:dropdown]

      output_buffer << content_tag(:a, html_text.html_safe, build_tag_options).html_safe
      super
    end

    private
    def default_options
      {
        :class        => "btn",
        :bootstrap_class_prefix => "btn-",
        :type         => nil,
        :size         => nil,
        :disabled     => false,
        :dropdown     => false,
        :id            => nil,
        :icon          => {},
        :html_options => {}
      }
    end

    def build_class
      classes = [ options[:class] ]
      classes << "#{options[:bootstrap_class_prefix]}#{options[:type]}" if options[:type]
      classes << "#{options[:bootstrap_class_prefix]}#{options[:size]}" if options[:size]
      classes << 'dropdown-toggle' if options[:dropdown]
      classes << 'disabled' if options[:disabled]
      classes.join(" ")
    end

    def build_icon
=begin
      if (options[:icon][:color].eql?(:white) || options[:type].blank?)
        options[:icon] = { :color => :white }
      end
=end
      Icon.new(options[:icon]).to_s
    end

    def build_caret
      content_tag(:span, nil, :class => 'caret')
    end

    def build_tag_options
      ops = { :href => @link, :class => build_class }
      ops[:"data-toggle"] = 'dropdown' if options[:dropdown]
      ops[:id] = options[:id] if options[:id]
      ops.reverse_merge(options[:html_options])
    end
  end
end
