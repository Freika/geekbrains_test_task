# frozen_string_literal: true

describe Participations::Create do
  let!(:user)   { create(:user) }
  let!(:course) { create(:course) }
  let!(:group)  { create(:group, course: course) }

  context 'when success' do
    let!(:success_message) { 'You have successfully joined to this course!' }

    it 'creates a participation' do
      expect do
        described_class.new.call(course, group.id, user.id)
      end.to change(Participation, :count).by(1)
    end

    it 'returns success message' do
      result = described_class.new.call(course, group.id, user.id)

      expect(result).to eq(success_message)
    end
  end

  context 'when failure' do
    let!(:participation)  { create(:participation, user: user, group: group) }
    let(:failure_message) { 'It seems like you already on this course! Try another group!' }
    let(:group_not_found_message) { 'Group not found' }
    let(:course_not_found_message) { 'Course not found' }

    it 'does not create participation' do
      expect do
        described_class.new.call(course, group.id, user.id)
      end.to change(Participation, :count).by(0)
    end

    it 'returns failure message' do
      result = described_class.new.call(course, group.id, user.id)

      expect(result).to eq(failure_message)
    end

    context 'when group is gone' do
      it 'returns group not found message' do
        group.destroy

        result = described_class.new.call(course, group.id, user.id)

        expect(result).to eq(group_not_found_message)
      end
    end
  end
end
