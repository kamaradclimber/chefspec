module ChefSpec::API
  # @since 0.9.0
  module NotificationsMatchers
    #
    # Assert that a resource notifies another. Given a Chef Recipe that
    # notifies a template resource to restart apache:
    #
    #     ifconfig '10.0.0.1' do
    #       action :add
    #     end
    #
    # The Examples section demonstrates the different ways to test an
    # +ifconfig+ resource with ChefSpec.
    #
    # @example Assert the template notifies apache of something
    #   template = chef_run.template('/etc/apache2.conf')
    #   expect(template).to notify('service[apache2]')
    #
    # @example Assert the template notifies apache to restart
    #   expect(template).to notify('service[apache2]').to(:restart)
    #
    # @example Assert the template notifies apache to restart immediately
    #   expect(template).to notify('service[apache2]').to(:restart).immediately
    #
    # @example Assert the template notifies apache to restart delayed
    #   expect(template).to notify('service[apache2]').to(:restart).delayed
    #
    #
    # @param [String] signature
    #   the signature of the notification to match
    #
    # @return [ChefSpec::Matchers::NotificationsMatcher]
    #
    def notify(signature)
      ChefSpec::Matchers::NotificationsMatcher.new(signature)
    end
  end
end
