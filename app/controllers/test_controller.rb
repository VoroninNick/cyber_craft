class TestController < ApplicationController
  def test
    render layout: false
  end
end