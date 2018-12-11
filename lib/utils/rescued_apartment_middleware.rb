module Utils
  class ApartmentTenantMiddleware < Apartment::Elevators::Subdomain
    def call(*args)
      begin
        super
      rescue Apartment::TenantNotFound => e
        Rails.logger.error "ERROR: Apartment Tenant not found: #{Apartment::Tenant.current.inspect}"
        raise ExceptionHandler::TenantNotFound, e.message
      end
    end

    def parse_tenant_name(request)
      request.env['HTTP_X_TENANT']
    end
  end
end
