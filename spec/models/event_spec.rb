require 'rails_helper'
#TODO shoudla-matchers
RSpec.describe Event, type: :model do
  let(:event) { FactoryGirl.create(:event) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :tickets_amount }
  it { should validate_presence_of :date_start }
  it { should validate_presence_of :date_end }
  it { should validate_numericality_of(:tickets_amount).is_greater_than_or_equal_to(0) }
  it { should validate_length_of(:title).is_at_most(40) }
  it "it validates that date_end must be after_or_equal date_start" do
    event.date_end = Faker::Date.backward(5)
    expect(event).to_not be_valid
  end

  it "it validates that date_start must be after_or_equal current date" do
    event.date_start = Faker::Date.backward(5)
    expect(event).to_not be_valid
  end

end
