# encoding: utf-8

module Twitter::Bootstrap::Markup::Rails::Helpers
  module ButtonHelpers
    # Render a bootstrap button
    #
    # @param [String] text for the button face
    # @param [String] link for the button href
    # @param [Hash] options hash containing options (default: {}):
    #           :type         - Additional button type(s). For one, just specify a string, but
    #                           you can also pass an array (of sym or str) for multiple classes
    #           :disabled     - Will disable the button if set to true
    #           :icon_nanme   - Specify an icon name from bootstrap to prepend
    #           :icon_white   - Specify true if you want the icon to be white
    #           :id           - Assign an ID to the button
    #           :html_options - Any additional options you'd like to pass to the content_tag that will be created
    #                           for this button's a tag (for instance :target can be specified in :html_options).
    #
    # Examples
    #
    #   bootstrap_button 'Search', '#', :type => 'primary', :icon => 'search'
    #
    def bootstrap_button(text, link, options = {})
      Twitter::Bootstrap::Markup::Rails::Components::Button.new(
        text,
        link,
        options
      ).to_s
    end

    # Render a dropdown button
    #
    # @param [Hash] options hash containing options (default: {}):
    #
    # Examples
    #
    #   bootstrap_button_dropdown do |e|
    #     e.bootstrap_button "Button Title", "http://google.com"
    #     e.link_to "Blah", @blah
    #   end
    #
    # Returns HTML String for the dropdown
    #
    def bootstrap_button_dropdown(options = {})
      # Elements will hold every call made to this block. Self is passed in so the
      # elements can be sent to it in order to be evaluated
      elements = Twitter::Bootstrap::Markup::Rails::HelperCollection.new(self)

      yield elements

      Twitter::Bootstrap::Markup::Rails::Components::ButtonDropdown.new(
        elements,
        options
      ).to_s
    end

    # Render a bootstrap button
    #
    # @param [String] text for the button face
    # @param [String] link for the button href
    # @param [Hash] options hash containing options (default: {}):
    #           :type         - Additional button type(s). For one, just specify a string, but
    #                           you can also pass an array (of sym or str) for multiple classes
    #           :disabled     - Will disable the button if set to true
    #           :icon_name   - Specify an icon name from bootstrap to prepend
    #           :icon_white   - Specify true if you want the icon to be white
    #           :id           - Assign an ID to the button
    #           :html_options - Any additional options you'd like to pass to the content_tag that will be created
    #                           for this button's a tag (for instance :target can be specified in :html_options).
    #
    # Examples
    #
    #   bootstrap_link_to 'Search', '#', :type => 'primary', :icon => 'search'
    #
    def bootstrap_link_to(text, link, options = {})
      options[:bootstrap_class_prefix] = nil
      Twitter::Bootstrap::Markup::Rails::Components::Button.new(
          text,
          link,
          options
      ).to_s
    end

    def bootstrap_link_to_unless(condition, text, link, options = {}, &block)
      if condition
        if block_given?
          block.arity <= 1 ? capture(text, &block) : capture(text, link, options, &block)
        else
          text
        end
      else
        bootstrap_link_to(text, link, options)
      end
    end

    def bootstrap_link_to_if(condition, text, link, options = {}, &block)
      bootstrap_link_to_unless !condition, text, link, options, &block
    end

  end
end

