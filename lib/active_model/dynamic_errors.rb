module ActiveModel
  class Errors
    # Redefine the ActiveModel::Errors::full_message method:
    #   'Base' messages are handled as usual.
    #   Non-base messages are prefixed with the attribute name as usual UNLESS
    #   they begin with '^' in which case the attribute name is omitted.
    #   E.g. validates_acceptance_of :accepted_terms, :message => '^Please accept the terms of service'
    def full_message(attribute, message)
      return message if attribute == :base
      attr_name = attribute.to_s.gsub('.', '_').humanize
      attr_name = @base.class.human_attribute_name(attribute, :default => attr_name)
      if self.class.is_full_message(message)
        I18n.t(:"errors.dynamic_format", {
          :default   => "%{message}",
          :attribute => attr_name,
          :message   => self.class.fix_if_full_message(message)
        })
      else
        I18n.t(:"errors.format", {
          :default   => "%{attribute} %{message}",
          :attribute => attr_name,
          :message   => message
        })
      end
    end

    FULL_MESSAGE_MARKER = '^'

    def self.is_full_message(message)
      message[0] == FULL_MESSAGE_MARKER
    end

    def self.fix_if_full_message(message)
      is_full_message(message) ? message[1..-1] : message
    end
  end
end

require 'active_support/i18n'
I18n.load_path << File.dirname(__FILE__) + '/locale/en.yml'
