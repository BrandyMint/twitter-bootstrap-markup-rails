# encoding: utf-8
module Twitter::Bootstrap::Markup::Rails::Helpers
  module BadgeHelpers
    # Renders badge
    #
    # @param [String] message message to be displayed
    # @param [Hash] options hash containing options (default: {}):
    #           :type         - The String type of alert to display: success warning important notice
    #           :html_options - Any additional options you'd like to pass to the span tag that will be created
    #                           for this label (for instance :"data-whatever" can be specified in :html_options).
    #
    # Examples
    #
    #   bootstrap_badge_tag("Hello!")
    #   # => '<span class="badge">Hello!</span>'
    #
    # Returns HTML String for the label
    def bootstrap_badge_tag(message, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Badge.new(
        message,
        options
      ).to_s
    end

    %w(success warning important notice).each do |type|
      module_eval <<-EOF
        def bootstrap_badge_#{type}_tag(message, options = {})
          bootstrap_badge_tag(message, options.merge({ :type => "#{type}" }))
        end
      EOF
    end
  end
end

