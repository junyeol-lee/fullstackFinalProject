# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])

    if product.nil?
      redirect_to root_path
      nil
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: product.name,
          description: product.description,
          amount: product.cost_cents,
          currency: 'cad',
          quantity: 1
        }
      ],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
    )

    respond_to do |format|
      format.js # r ender app/views/checkout/create.js.erb
    end
  end
end
