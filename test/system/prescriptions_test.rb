require 'application_system_test_case'

class PrescriptionsTest < ApplicationSystemTestCase
  setup do
    @prescription = prescriptions(:one)
  end

  test 'visiting the index' do
    visit prescriptions_url
    assert_selector 'h1', text: 'Prescriptions'
  end

  test 'creating a Prescription' do
    visit prescriptions_url
    click_on 'New Prescription'

    fill_in 'Doctor', with: @prescription.doctor
    fill_in 'Hospital', with: @prescription.hospital
    fill_in 'Pharmacy', with: @prescription.pharmacy
    fill_in 'Start time', with: @prescription.start_time
    fill_in 'Visit date', with: @prescription.visit_date
    click_on 'Create Prescription'

    assert_text 'Prescription was successfully created'
    click_on 'Back'
  end

  test 'updating a Prescription' do
    visit prescriptions_url
    click_on 'Edit', match: :first

    fill_in 'Doctor', with: @prescription.doctor
    fill_in 'Hospital', with: @prescription.hospital
    fill_in 'Pharmacy', with: @prescription.pharmacy
    fill_in 'Start time', with: @prescription.start_time
    fill_in 'Visit date', with: @prescription.visit_date
    click_on 'Update Prescription'

    assert_text 'Prescription was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Prescription' do
    visit prescriptions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Prescription was successfully destroyed'
  end
end
