module Twitter::Bootstrap::Markup::Rails::Components
  class Icon < Base

    def initialize(options = {})
      super
    end

    def to_s
      output_buffer << content_tag(:i, nil, build_tag_options).html_safe
      super
    end

    private
    def default_options
      {
        :class        => nil,
        :class_prefix => "icon-",
        :color        => :black,
        :name         => nil,
        :html_options => {}
      }
    end

    def build_class
      klass = [ options[:class] ]
      klass << "#{options[:class_prefix]}#{options[:name]}" if options[:name]
      klass << " icon-white" unless options[:color].equal?(:black)
      classes.join(" ")
    end

    def build_tag_options
      ops = {:class => build_class}
      ops.reverse_merge(options[:html_options])
    end
  end
end

