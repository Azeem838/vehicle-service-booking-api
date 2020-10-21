require 'rails_helper'

RSpec.describe ServicesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/services').to route_to('services#index')
    end
  end
end
