module Stripe
  class BillingPortalController < ApplicationController
    def create
      Rails.logger.debug "Creating billing portal session for user: #{current_user.stripe_customer_id}"
      session = Stripe::BillingPortal::Session.create({
                                                        customer: current_user.stripe_customer_id,
                                                        return_url: pricing_url
                                                      })
      redirect_to session.url, allow_other_host: true
    end
  end
end
