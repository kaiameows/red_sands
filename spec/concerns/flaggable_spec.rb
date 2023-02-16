# frozen_string_literal: true

RSpec.describe RedSands::Concerns::Flaggable do
  let(:flaggable) do
    Class.new do
      include RedSands::Concerns::Flaggable
      add_flag :meowy, true
    end
  end

  it 'allows flags to be added' do
    expect(flaggable.new.meowy).to eq true
  end

  it 'defines boolean methods for flags' do
    expect(flaggable.new.meowy?).to eq true
  end

  context 'changing flag values' do
    let(:f) { flaggable.new }
    before { f.meowy = false }
    it 'allows flag values to be changed' do
      expect(f.flags[:meowy]).to be_falsey
    end
  end

  context 'adding new instance flags' do
    let(:f) { flaggable.new }
    before { f.add_flag :woofy, true }
    it 'allows new flags to be added to the specific instance' do
      expect(f.flags[:woofy]).to be_truthy
    end

    it 'does not set the flag for all instances' do
      expect(flaggable.new.flags[:woofy]).to be_nil
    end

    it 'defines accessor methods for the instance' do
      (%i[woofy woofy? woofy=] - f.singleton_class.instance_methods).empty?
    end
  end
end
