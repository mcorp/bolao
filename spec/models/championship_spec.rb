require 'spec_helper'

describe Championship do
  ## validations
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:started_at) }
  it { expect(subject).to validate_presence_of(:finished_at) }

  ## methods
  it { expect(subject.to_s).to eq subject.name }

  context '#started?' do
    it 'in the past' do
      subject = build(:championship, started_at: Time.now - 1)
      expect(subject.started?).to eq true
    end

    it 'in the future' do
      subject = build(:championship, started_at: Time.now + 1)
      expect(subject.started?).to eq false
    end
  end

  context '#finished?' do
    it 'finished in the past' do
      subject = build(:championship, finished_at: Time.now - 1)
      expect(subject.finished?).to eq true
    end

    it 'finish in the future' do
      subject = build(:championship, finished_at: Time.now + 1)
      expect(subject.finished?).to eq false
    end
  end
end