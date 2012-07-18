# encoding: utf-8
module Twitter::Bootstrap::Markup::Rails::Helpers
  module IconHelpers
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
    #   bootstrap_icon_tag(:name => 'user', :color => :white)
    #   # => '<i class="icon-user icon-white"></i>'
    #
    # Returns HTML String for the label
    def bootstrap_icon_tag(options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Icon.new(
        options
      ).to_s
    end

  end
end

