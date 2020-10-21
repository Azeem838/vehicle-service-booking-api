require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:service) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:service_id) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end
