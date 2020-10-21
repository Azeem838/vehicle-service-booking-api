require 'rails_helper'

RSpec.describe AppointmentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/appointments').to route_to('appointments#index')
    end

    it 'routes to #create' do
      expect(post: '/appointments').to route_to('appointments#create')
    end
  end
end
