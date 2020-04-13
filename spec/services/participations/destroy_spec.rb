# frozen_string_literal: true

describe Participations::Destroy do
  let!(:user)   { create(:user) }
  let!(:course) { create(:course) }
  let!(:group)  { create(:group, course: course) }

  context 'when success' do
    let!(:participation) { create(:participation, group: group, user: user) }
    let!(:success_message) { 'You successfully left this course :(' }

    it 'deletes a participation' do
      expect { described_class.new.call(course, group.id, user.id) }.to change(Participation, :count).by(-1)
    end

    it 'returns success message' do
      result = described_class.new.call(course, group.id, user.id)

      expect(result).to eq(success_message)
    end
  end

  context 'when failure' do
    let(:failure_message) { 'You are not on this course so you can not leave it!' }

    it 'does not delete a participation' do
      expect do
        described_class.new.call(course, group.id, user.id)
      end.to change(Participation, :count).by(0)
    end

    it 'returns failure message' do
      result = described_class.new.call(course, group.id, user.id)

      expect(result).to eq(failure_message)
    end

    context 'when group not found' do
      let(:group_not_found_message) { 'Group not found' }

      it 'returns group_not_found_message' do
        group.destroy

        result = described_class.new.call(course, group.id, user.id)

        expect(result).to eq(group_not_found_message)
      end
    end
  end
end
