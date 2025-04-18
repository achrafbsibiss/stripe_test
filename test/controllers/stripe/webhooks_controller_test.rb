require "test_helper"

class Stripe::WebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get stripe" do
    get stripe_webhooks_stripe_url
    assert_response :success
  end
end
